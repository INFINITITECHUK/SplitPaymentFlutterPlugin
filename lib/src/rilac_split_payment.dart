import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rilac_split_payment/global/functions.dart';
import 'package:rilac_split_payment/global/model/hive_functions.dart';
import 'package:rilac_split_payment/global/model/hive_model.dart';
import 'package:rilac_split_payment/global/model/return_response.dart';
import 'package:rilac_split_payment/global/model/splitPaymentCustomerDetailsModel.dart';
import 'package:rilac_split_payment/global/shared_preference.dart';

import '../global/global_variable.dart';

class SplitPayment extends Functions {

  SplitPayment();

  SplitPayment.config({required String apiBaseUrl, required String basicToken, required String apiModuleKey,
    required String phoneNumber, String keyword = "PMNT", required String userDeviceId, required String userAppVersion,
    required String userPhoneBrand, required String usrPhoneOs, required String userOsVersion,}) {
    globalBaseUrl = apiBaseUrl;
    globalAccessToken = basicToken;
    globalModuleKey = apiModuleKey;
    accountNumber = phoneNumber;
    amlKeyword = keyword;
    deviceId = userDeviceId;
    appVersion = userAppVersion;
    phoneBrand = userPhoneBrand;
    phoneOs = usrPhoneOs;
    osVersion = userOsVersion;

    SharedPrefs.getBaseURL().then((value) =>
    {
      if(value.isEmpty){
        SharedPrefs.saveConfig(
          baseUrl: apiBaseUrl,
          module: apiModuleKey,
          token: basicToken,
          phoneNumber: phoneNumber,
          keyword: keyword,
          userDeviceId: userDeviceId,
          userAppVersion: userAppVersion,
          userPhoneBrand: userPhoneBrand,
          usrPhoneOs: usrPhoneOs,
          userOsVersion: userOsVersion,
        ),
      }
    });
    debugPrint("Plugin configuration successful");
  }

  static Future<void> initialize() async {
    await Hive.initFlutter();
    Hive.registerAdapter(SplitCustomerInfoAdapter());
    await Hive.openBox<SplitCustomerInfo>(hiveBoxNameSplitCustomer);
  }

  @override
  Future<dynamic> initiateSplitPayment({required double amount, required int splitNumber, required String invoiceId}) async {
    try {
      // Validate inputs
      if (amount <= 0 || splitNumber <= 0) {
        return returnResponse(isSuccess: false, statusCode: 400, message: "Amount and split number must be greater than zero");
      }
      // Split the amount evenly
      double splitAmount = amount / splitNumber;
      // Simulated payload with validation
      Map<String, dynamic> payload = {
        "customerNumber": splitNumber,
        "splitAmount": splitAmount,
        "totalAmount": amount
      };
      // Save split payment (assuming this function works correctly)
      await SharedPrefs.saveSplitPayment(amount: amount, numberOfSplit: splitNumber, invoice: invoiceId);
      return returnResponse(isSuccess: true, statusCode: 200, payload: payload, message: "Split payment setup successful");
    } catch (e) {
      return returnResponse(isSuccess: false, statusCode: 500, message: "Failed to setup split payment: ${e.toString()}");

    }
  }

  @override
  Future<Map<String, dynamic>> submitCustomSplitPaymentInfo({required List<SplitPaymentCustomerDetailsModel> splitCustomerDetails}) async {
    double amount = await SharedPrefs.getAmount();
    int splitNumber = await SharedPrefs.getSplitNumber();
    try {
      // Validate list length
      if (splitCustomerDetails.length != splitNumber) {
        return returnResponse(isSuccess: false, statusCode: 400, message: "The list length must be equal to the split number.");
      }
      // Validate each entry in the list and calculate total amount
      double totalSplitAmount = 0;
      for (var split in splitCustomerDetails) {
        totalSplitAmount += split.splitAmount;
      }
      // Validate that total split amount matches the original amount
      if (totalSplitAmount != amount) {
        return returnResponse(isSuccess: false, statusCode: 400, message: "Total split amount (${totalSplitAmount.toStringAsFixed(2)}) must equal the original amount (${amount.toStringAsFixed(2)}).");
      }
      // Save split payment
      await HiveFunctions.saveSplitCustomer(splitCustomerDetails);
      // Convert List<Model> to List<Map<String, dynamic>>
      List<Map<String, dynamic>> jsonPayload = HiveFunctions.getSplitCustomerList().map((e) => e.toJson()).toList();
      return returnResponse(isSuccess: true, statusCode: 200, payload: jsonPayload, message: "Customer split payment setup successful.(status: 0 = pending, 1 = processing, 2 = complete, 3 = failed)");
    } catch (e) {
      return returnResponse(isSuccess: false, statusCode: 500, message: "Failed to setup split payment: ${e.toString()}");
    }
  }

  @override
  Future<Map<String, dynamic>> updateCustomSplitPaymentInfo({required int customerId, required SplitPaymentCustomerDetailsModel splitCustomerDetails}) async{
    try {
      var isUpdated = await HiveFunctions.updateSplitCustomer(customerId, splitCustomerDetails);
      if(!isUpdated){
        return returnResponse(isSuccess: false, statusCode: 500, message: "Failed to update customer details");
      }
      var splitCustomerList = HiveFunctions.getSplitCustomerList();
      double amount = await SharedPrefs.getAmount();
      int splitNumber = await SharedPrefs.getSplitNumber();
      // Validate list length
      if (splitCustomerList.length != splitNumber) {
        return returnResponse(isSuccess: false, statusCode: 400, message: "The list length must be equal to the split number.");
      }
      // Validate each entry in the list and calculate total amount
      double totalSplitAmount = 0;
      for (var split in splitCustomerList) {
        totalSplitAmount += split.amount;
      }
      // Validate that total split amount matches the original amount
      if (totalSplitAmount > amount) {
        return returnResponse(isSuccess: false, statusCode: 400, message: "Total split amount (${totalSplitAmount.toStringAsFixed(2)}) must equal the original amount (${amount.toStringAsFixed(2)}).");
      }
      // Convert List<Model> to List<Map<String, dynamic>>
      List<Map<String, dynamic>> jsonPayload = HiveFunctions.getSplitCustomerList().map((e) => e.toJson()).toList();
      return returnResponse(isSuccess: true, statusCode: 200, payload: jsonPayload, message: "Customer details update successful");
    } catch (e) {
      return returnResponse(isSuccess: false, statusCode: 500, message: "Failed to update customer details: ${e.toString()}");
    }
  }

  @override
  Future<Map<String, dynamic>> getSplitCustomerList() async{
    List<Map<String, dynamic>> jsonPayload = HiveFunctions.getSplitCustomerList().map((e) => e.toJson()).toList();
    return returnResponse(isSuccess: true, statusCode: 200, payload: jsonPayload, message: "Request successful");
  }
  @override
  Future<Map<String, dynamic>> submitPayment({required int customerId, required String pin}) async{
    var customerDetails = await HiveFunctions.getCustomerDetailsById(customerId);
    if(customerDetails == null){
      return returnResponse(isSuccess: false, statusCode: 404, message: "Customer not found");
    }else if(customerDetails.status == 2){
      return returnResponse(isSuccess: false, statusCode: 400, message: "This customer has already been paid");
    }else if(customerDetails.status != 2){
      return await GlobalFunctions().getAmlCheck(customerDetails, pin);
    }else{
      return returnResponse(isSuccess: false, statusCode: 400, message: "Something went wrong");
    }
    throw UnimplementedError();
  }

  @override
  Future cleanSplitPayment() async{
    await HiveFunctions.cleanSplitCustomer();
    await SharedPrefs.clearSplitPayment();
    return returnResponse(isSuccess: true, statusCode: 200, message: "Successfully cleaned split payment");
  }
}