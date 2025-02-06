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

  static saveConfig({required String baseUrl, required String module, required String token, required String phoneNumber,
    required String keyword, required String userDeviceId, required String userAppVersion, required String userPhoneBrand,
    required String usrPhoneOs, required String userOsVersion}) async {
    SharedPreferences.getInstance().then((prefs) async => {
      await prefs.setString("split_baseURL", baseUrl),
      await prefs.setString("split_module", module),
      await prefs.setString("split_token", token),
      await prefs.setString("split_phone_number", phoneNumber),
      await prefs.setString("split_keyword", token),

      await prefs.setString("split_userDeviceId", userDeviceId),
      await prefs.setString("split_userAppVersion", userAppVersion),
      await prefs.setString("split_userPhoneBrand", userPhoneBrand),
      await prefs.setString("split_usrPhoneOs", usrPhoneOs),
      await prefs.setString("split_userOsVersion", userOsVersion),
    });
  }


  static Future<String> getBaseURL() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("split_baseURL") ?? "";
  }

  String get baseURL => _sharedPrefs?.getString("split_baseURL") ?? globalBaseUrl;



  static Future<void> saveSplitPayment({required double amount, required int numberOfSplit, required String invoice}) async {
    SharedPreferences.getInstance().then((prefs) async => {
      await prefs.setDouble("split_amount", amount),
      await prefs.setInt("split_number", numberOfSplit),
      await prefs.setString("split_invoice", invoice),
    });
  }

  static Future<void> clearSplitPayment() async {
    SharedPreferences.getInstance().then((prefs) async => {
      await prefs.remove("split_amount"),
      await prefs.remove("split_number"),
      await prefs.remove("split_invoice"),
    });
  }

  static Future<double> getAmount() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getDouble("split_amount") ?? 0;
  }

  static Future<int> getSplitNumber() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getInt("split_number") ?? 0;
  }

  static Future<String> getInvoice() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("split_invoice") ?? "";
  }

}

final sharedPreference = SharedPrefs();