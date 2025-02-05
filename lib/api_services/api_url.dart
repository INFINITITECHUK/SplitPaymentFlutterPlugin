import 'package:rilac_split_payment/global/shared_preference.dart';

class ApiUrl {
  static String baseURL = sharedPreference.baseURL;
  static String getAmlUrl = "${baseURL}jrxapi/JsonRx/GetAmlConfirmResponse";
  static String transferUrl = "${baseURL}remittance/transfer/send";
  static String getTransactionResultUrl = "${baseURL}jrxapi/JsonRx/GetTransactionResult";
}
