import 'package:rilac_split_payment/api_repository/model/request/GetAmlRequestBody.dart';
import 'package:rilac_split_payment/global/global_variable.dart';
import 'package:rilac_split_payment/global/model/hive_model.dart';
import 'package:rilac_split_payment/global/model/splitPaymentCustomerDetailsModel.dart';
import 'package:rilac_split_payment/global/shared_preference.dart';

abstract class Functions {

  Future<dynamic> setupSplitPayment({required double amount, required int splitNumber, required String invoiceId});

  Future<dynamic> setupCustomSplitPayment({required List<SplitPaymentCustomerDetailsModel> splitCustomerDetails});

  Future<dynamic> updateSingleCustomerInfo({required int customerId, required SplitPaymentCustomerDetailsModel splitCustomerDetails});

  Future<dynamic> getSplitCustomerList();

  Future<dynamic> submitPayment({required int customerId, required String pin});
}

class GlobalFunctions{

  Future<GetAmlRequestBody> getAmlBody(SplitCustomerInfo customerInfo, String pin) async{
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
      destinationMsisdnPrefix: "Y",
      fullName: " ",
      appVersion: " ",
      phoneBrand: " ",
      phoneOs: " ",
      osVersion: " ",
    );
    return getAmlBody;
  }


}