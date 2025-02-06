import 'package:rilac_split_payment/api_repository/model/request/GetAmlRequestBody.dart';
import 'package:rilac_split_payment/api_repository/model/request/TransactionResultBody.dart';
import 'package:rilac_split_payment/api_repository/model/request/TransferBody.dart';
import 'package:rilac_split_payment/api_repository/repository.dart';
import 'package:rilac_split_payment/global/global_variable.dart';
import 'package:rilac_split_payment/global/model/hive_functions.dart';
import 'package:rilac_split_payment/global/model/hive_model.dart';
import 'package:rilac_split_payment/global/model/return_response.dart';
import 'package:rilac_split_payment/global/model/splitPaymentCustomerDetailsModel.dart';
import 'package:rilac_split_payment/global/shared_preference.dart';

abstract class Functions {

  Future<dynamic> setupSplitPayment({required double amount, required int splitNumber, required String invoiceId});

  Future<dynamic> setupCustomSplitPayment({required List<SplitPaymentCustomerDetailsModel> splitCustomerDetails});

  Future<dynamic> updateSingleCustomerInfo({required int customerId, required SplitPaymentCustomerDetailsModel splitCustomerDetails});

  Future<dynamic> getSplitCustomerList();

  Future<dynamic> submitPayment({required int customerId, required String pin});

  Future<dynamic> cleanSplitPayment();
}

class GlobalFunctions{

  Future<dynamic> getAmlCheck(SplitCustomerInfo customerInfo, String pin) async{

    var apiRepository = ApiRepository();

    var ref = await SharedPrefs.getInvoice();
    GetAmlRequestBody getAmlBody = GetAmlRequestBody(
      msisdn: customerInfo.customerNumber,
      destinationMsisdn: accountNumber,
      referenceId: ref,
      keyword: amlKeyword,
      currency: "XCD",
      amount: customerInfo.amount.toString(),
      pin: pin,
      isMarchant: "N",
      destinationMsisdnPrefix: "N",
      fullName: deviceId,
      appVersion: appVersion,
      phoneBrand: phoneBrand,
      phoneOs: phoneOs,
      osVersion: osVersion,
    );

    var amlResponse = await apiRepository.getAmlCheck(getAmlBody);
    if(amlResponse.responseCode == 100){
      var transferBody = TransferBody(
        sourcemsisdn: customerInfo.customerNumber,
        destmsisdn: accountNumber,
        referenceId: ref,
        keyword: amlKeyword,
        amount: customerInfo.amount.toString(),
        pin: pin,
        lang: "ENG",
      );
      var transferResponse = await apiRepository.transfer(transferBody);
      if(transferResponse.responseCode == 100){
        await Future.delayed(const Duration(milliseconds: 5000));
        var transactionResultBody = TransactionResultBody(
          fullName: deviceId,
          appVersion: appVersion,
          phoneBrand: phoneBrand,
          phoneOs: phoneOs,
          osVersion: osVersion,
          msisdn: customerInfo.customerNumber,
          transactionId: transferResponse.transactionId,
        );
        var transactionResultResponse = await apiRepository.getTransactionResult(transactionResultBody);
        if(transactionResultResponse.responseCode == 100){
          await HiveFunctions.splitPaymentStatusUpdate(customerInfo.customerNumber, 2);
          var customerList = HiveFunctions.getSplitCustomerList();
          var statusCount = 0;
          for (var customer in customerList) {
            if(customer.status == 2){
              statusCount++;
            }
          }

          List<Map<String, dynamic>> jsonPayload = customerList.map((e) => e.toJson()).toList();
          var json = {
            "customerList": jsonPayload,
            "completePaymentCount": statusCount
          };
          return returnResponse(isSuccess: true, statusCode: (transactionResultResponse.responseCode ?? 200).toInt(), payload: json, message: transactionResultResponse.responseDescription ?? "transaction successful");
        }else{
          await HiveFunctions.splitPaymentStatusUpdate(customerInfo.customerNumber, 3);
          return returnResponse(isSuccess: false, statusCode: (transactionResultResponse.responseCode ?? 400).toInt(), message: transactionResultResponse.responseDescription ?? "transaction failed");
        }
      }else{
        await HiveFunctions.splitPaymentStatusUpdate(customerInfo.customerNumber, 3);
        return returnResponse(isSuccess: false, statusCode: (transferResponse.responseCode ?? 400).toInt(), message: transferResponse.responseDescription ?? "transaction failed");
      }
    }else{
      await HiveFunctions.splitPaymentStatusUpdate(customerInfo.customerNumber, 3);
      return returnResponse(isSuccess: false, statusCode: amlResponse.responseCode ?? 400, message: amlResponse.responseDescription ?? "AML check failed");
    }
  }


}