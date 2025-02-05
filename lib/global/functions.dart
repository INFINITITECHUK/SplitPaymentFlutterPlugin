import 'package:rilac_split_payment/global/model/splitPaymentCustomerDetailsModel.dart';

abstract class Functions {

  Future<dynamic> setupSplitPayment({required double amount, required int splitNumber, required String invoiceId});

  Future<dynamic> setupCustomSplitPayment({required List<SplitPaymentCustomerDetailsModel> splitCustomerDetails});

  Future<dynamic> updateSingleCustomerInfo({required int customerId, required SplitPaymentCustomerDetailsModel splitCustomerDetails});

  Future<dynamic> getSplitCustomerList();

  Future<dynamic> submitPayment({required int customerId});
}