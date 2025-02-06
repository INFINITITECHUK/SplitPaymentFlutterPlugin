import 'package:hive_flutter/adapters.dart';
import 'package:rilac_split_payment/global/global_variable.dart';
import 'package:rilac_split_payment/global/model/hive_model.dart';

import 'splitPaymentCustomerDetailsModel.dart';

class HiveFunctions{

  static Future<void> saveSplitCustomer(List<SplitPaymentCustomerDetailsModel> splitCustomerDetails) async {
    Box<SplitCustomerInfo> box = Hive.box(hiveBoxNameSplitCustomer);
    await box.clear();
    int lastId = box.isNotEmpty ? box.values.last.id : 0;
    for (var element in splitCustomerDetails) {
      lastId++; // Increment ID for each new entry
      await box.add(SplitCustomerInfo(
        id: lastId,
        customerNumber: element.customerNumber,
        amount: element.splitAmount,
        status: 0,
      ));
    }
  }

  static List<SplitCustomerInfo> getSplitCustomerList() {
    Box<SplitCustomerInfo> box = Hive.box(hiveBoxNameSplitCustomer);
    return box.values.toList();
  }

  // status 0 = pending, 1 = processing, 2 = complete, 3 = failed
  static Future<bool> updateSplitCustomer(int id, SplitPaymentCustomerDetailsModel splitCustomerDetails) async {
    Box<SplitCustomerInfo> box = Hive.box<SplitCustomerInfo>(hiveBoxNameSplitCustomer);
    // Find the index of the customer entry
    int index = box.values.toList().indexWhere((customer) => customer.id == id);
    if (index != -1) {
      var info = box.values.toList();
      if(info[index].status != 2) {
        await box.putAt(index, SplitCustomerInfo(id: id, customerNumber: splitCustomerDetails.customerNumber, amount: splitCustomerDetails.splitAmount, status: 0,));
        return true;
      }
      return false;
    }else{
      return false;
    }
  }


  // status 0 = pending, 1 = processing, 2 = complete, 3 = failed
  static Future<bool> splitPaymentStatusUpdate(String customerNumber, int status) async {
    Box<SplitCustomerInfo> box = Hive.box<SplitCustomerInfo>(hiveBoxNameSplitCustomer);
    // Find the index of the customer entry
    int index = box.values.toList().indexWhere((customer) => customer.customerNumber == customerNumber);
    if (index != -1) {
      var customerInfo = box.values.toList()[index];
      await box.putAt(index, SplitCustomerInfo(id: customerInfo.id, customerNumber: customerInfo.customerNumber, amount: customerInfo.amount, status: status,));
      return true;
    }else{
      return false;
    }
  }


  static Future<SplitCustomerInfo?> getCustomerDetailsById(int customerId) async {
    Box<SplitCustomerInfo> box = Hive.box<SplitCustomerInfo>(hiveBoxNameSplitCustomer);
    // Find the index of the customer entry
    int index = box.values.toList().indexWhere((customer) => customer.id == customerId);
    if (index != -1) {
      return box.values.toList()[index];
    }else{
      return null;
    }
  }

  static Future<void> cleanSplitCustomer() async {
    Box<SplitCustomerInfo> box = Hive.box<SplitCustomerInfo>(hiveBoxNameSplitCustomer);
    await box.clear();
  }

}