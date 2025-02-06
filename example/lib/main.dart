import 'package:flutter/material.dart';
import 'package:rilac_split_payment/global/model/hive_functions.dart';
import 'package:rilac_split_payment/global/model/splitPaymentCustomerDetailsModel.dart';

import 'package:rilac_split_payment/rilac_split_payment.dart';

void main() {
  RilacSplitPayment.initialize();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  void initState() {
    var apiBaseUrl = "http://finifyapi.redltd.tech:8000/";
    var module = "JW9tc0ByZWRsdGQl";
    var basicToken = "Basic ODgwMTY3NDg4NjY2MDo2YzkyMTk4NzdmYjBhOTMxNzliNWJkNTZkMmZhNGIzMjliZDA2NTZhMzY0YjdmMzMxMTgwNDc1ODY5Y2VkZmE0";
    var number = "8801674886660";
    RilacSplitPayment.config(apiBaseUrl: apiBaseUrl, basicToken: basicToken, apiModuleKey: module, keyword: "PMNT", phoneNumber: number,
      userDeviceId: "*", userAppVersion: "*", userPhoneBrand: "*", usrPhoneOs: "*", userOsVersion: "*");
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Split Payment Plugin'),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () async{
                var result = await RilacSplitPayment().setupSplitPayment(amount: 100, splitNumber: 4, invoiceId: "123213213");
                debugPrint("result: ${result.toString()}");
              }, child: const Text("Step 1: Configure Split Payment")),

              ElevatedButton(onPressed: () async{
                List<SplitPaymentCustomerDetailsModel> splitCustomerDetails = [];
                splitCustomerDetails.add(SplitPaymentCustomerDetailsModel(customerNumber: "8801763643634", splitAmount: 20));
                splitCustomerDetails.add(SplitPaymentCustomerDetailsModel(customerNumber: "8801630337757", splitAmount: 30));
                splitCustomerDetails.add(SplitPaymentCustomerDetailsModel(customerNumber: "123456777", splitAmount: 35));
                splitCustomerDetails.add(SplitPaymentCustomerDetailsModel(customerNumber: "123456666", splitAmount: 15));

                var result = await RilacSplitPayment().setupCustomSplitPayment(splitCustomerDetails: splitCustomerDetails);
                debugPrint("result: ${result.toString()}");
              }, child: const Text("Step 2: Configure Customer Details")),

              ElevatedButton(onPressed: () async{
                ///Note: if status  == 2(complete), not able to update customer details.
                var splitCustomerDetails =  SplitPaymentCustomerDetailsModel(customerNumber: "123456788", splitAmount: 30);
                var result = await RilacSplitPayment().updateSingleCustomerInfo(customerId: 2, splitCustomerDetails: splitCustomerDetails);
                debugPrint("result: ${result.toString()}");
              }, child: const Text("Step 2.1: Update Single Customer Details")),


              ElevatedButton(onPressed: () async{
                var result = await RilacSplitPayment().getSplitCustomerList();
                debugPrint("result: ${result.toString()}");
              }, child: const Text("Step 2.2: Get Customer details list")),


              ElevatedButton(onPressed: () async{
                var result = await RilacSplitPayment().submitPayment(customerId: 2, pin: "112233");
                debugPrint("result: ${result.toString()}");
              }, child: const Text("Step 3: Submit payment")),

            ],
          ),
        ),
      ),
    );
  }
}
