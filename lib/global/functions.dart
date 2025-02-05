import 'package:rilac_split_payment/global/model/splitPaymentCustomerDetailsModel.dart';

abstract class Functions {

  /*{
  "isSuccess": true,
  "statusCode": 200,
  "payload": {
  "customerNumber": 4,
  "splitAmount": 25.0
  },
  "message": "Split payment setup successful"
  }*/
  Future<dynamic> setupSplitPayment({required double amount, required int splitNumber, required String invoiceId});


  /*{
  "isSuccess": true,
  "statusCode": 200,
  "payload": [
    {
    "customerNumber": 101,
    "splitAmount": 40.0
    },
    {
    "customerNumber": 102,
    "splitAmount": 30.0
    },
    {
    "customerNumber": 103,
    "splitAmount": 30.0
    }
  ],
  "message": "Custom split payment setup successful"
  }*/
  Future<dynamic> setupCustomSplitPayment({required List<SplitPaymentCustomerDetailsModel> splitCustomerDetails});

  Future<dynamic> updateSingleCustomerInfo({required int customerId, required SplitPaymentCustomerDetailsModel splitCustomerDetails});


}