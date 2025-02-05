import 'dart:ffi';

import 'package:rilac_split_payment/global/global_variable.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  SharedPreferences? _sharedPrefs;

  SharedPrefs() {
    SharedPreferences.getInstance().then((prefs) {
      _sharedPrefs = prefs;
    });
  }

  static saveConfig({required String baseUrl, required String module, required String token}) async {
    SharedPreferences.getInstance().then((prefs) async => {
      await prefs.setString("rilac_baseURL", baseUrl),
      await prefs.setString("rilac_module", module),
      await prefs.setString("rilac_token", token),
    });
  }


  static Future<String> getBaseURL() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("rilac_baseURL") ?? "";
  }
  String get baseURL => _sharedPrefs?.getString("rilac_baseURL") ?? globalBaseUrl;



  static Future<void> saveSplitPayment({required double amount, required int numberOfSplit, required String invoice}) async {
    SharedPreferences.getInstance().then((prefs) async => {
      await prefs.setDouble("rilac_amount", amount),
      await prefs.setInt("rilac_split_number", numberOfSplit),
      await prefs.setString("rilac_invoice", invoice),
    });
  }

  static Future<double> getAmount() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getDouble("rilac_amount") ?? 0;
  }

  static Future<int> getSplitNumber() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getInt("rilac_split_number") ?? 0;
  }

  static Future<String> getInvoice() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("rilac_invoice") ?? "";
  }

}