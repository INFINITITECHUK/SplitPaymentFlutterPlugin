import 'dart:convert';
/// Msisdn : "211111111111"
/// DestinationMsisdn : "211112211221"
/// DestinationMsisdnPrefix : "N"
/// ReferenceId : ""
/// Keyword : "PMNT"
/// Currency : "XCD"
/// Amount : "9.9"
/// Pin : "123456"
/// FullName : "804832c13b0613a9"
/// AppVersion : "1.0.0"
/// PhoneBrand : "sdk_gphone64_x86_64"
/// PhoneOs : "android"
/// OsVersion : "13"
/// IsMarchant : "N"

GetAmlRequestBody getAmlRequestBodyFromJson(String str) => GetAmlRequestBody.fromJson(json.decode(str));
String getAmlRequestBodyToJson(GetAmlRequestBody data) => json.encode(data.toJson());
class GetAmlRequestBody {
  GetAmlRequestBody({
    String? msisdn,
    String? destinationMsisdn,
    String? destinationMsisdnPrefix,
    String? referenceId,
    String? keyword,
    String? currency,
    String? amount,
    String? pin,
    String? fullName,
    String? appVersion,
    String? phoneBrand,
    String? phoneOs,
    String? osVersion,
    String? isMarchant,}){
    _msisdn = msisdn;
    _destinationMsisdn = destinationMsisdn;
    _destinationMsisdnPrefix = destinationMsisdnPrefix;
    _referenceId = referenceId;
    _keyword = keyword;
    _currency = currency;
    _amount = amount;
    _pin = pin;
    _fullName = fullName;
    _appVersion = appVersion;
    _phoneBrand = phoneBrand;
    _phoneOs = phoneOs;
    _osVersion = osVersion;
    _isMarchant = isMarchant;
  }

  GetAmlRequestBody.fromJson(dynamic json) {
    _msisdn = json['Msisdn'];
    _destinationMsisdn = json['DestinationMsisdn'];
    _destinationMsisdnPrefix = json['DestinationMsisdnPrefix'];
    _referenceId = json['ReferenceId'];
    _keyword = json['Keyword'];
    _currency = json['Currency'];
    _amount = json['Amount'];
    _pin = json['Pin'];
    _fullName = json['FullName'];
    _appVersion = json['AppVersion'];
    _phoneBrand = json['PhoneBrand'];
    _phoneOs = json['PhoneOs'];
    _osVersion = json['OsVersion'];
    _isMarchant = json['IsMarchant'];
  }
  String? _msisdn;
  String? _destinationMsisdn;
  String? _destinationMsisdnPrefix;
  String? _referenceId;
  String? _keyword;
  String? _currency;
  String? _amount;
  String? _pin;
  String? _fullName;
  String? _appVersion;
  String? _phoneBrand;
  String? _phoneOs;
  String? _osVersion;
  String? _isMarchant;
  GetAmlRequestBody copyWith({  String? msisdn,
    String? destinationMsisdn,
    String? destinationMsisdnPrefix,
    String? referenceId,
    String? keyword,
    String? currency,
    String? amount,
    String? pin,
    String? fullName,
    String? appVersion,
    String? phoneBrand,
    String? phoneOs,
    String? osVersion,
    String? isMarchant,
  }) => GetAmlRequestBody(  msisdn: msisdn ?? _msisdn,
    destinationMsisdn: destinationMsisdn ?? _destinationMsisdn,
    destinationMsisdnPrefix: destinationMsisdnPrefix ?? _destinationMsisdnPrefix,
    referenceId: referenceId ?? _referenceId,
    keyword: keyword ?? _keyword,
    currency: currency ?? _currency,
    amount: amount ?? _amount,
    pin: pin ?? _pin,
    fullName: fullName ?? _fullName,
    appVersion: appVersion ?? _appVersion,
    phoneBrand: phoneBrand ?? _phoneBrand,
    phoneOs: phoneOs ?? _phoneOs,
    osVersion: osVersion ?? _osVersion,
    isMarchant: isMarchant ?? _isMarchant,
  );
  String? get msisdn => _msisdn;
  String? get destinationMsisdn => _destinationMsisdn;
  String? get destinationMsisdnPrefix => _destinationMsisdnPrefix;
  String? get referenceId => _referenceId;
  String? get keyword => _keyword;
  String? get currency => _currency;
  String? get amount => _amount;
  String? get pin => _pin;
  String? get fullName => _fullName;
  String? get appVersion => _appVersion;
  String? get phoneBrand => _phoneBrand;
  String? get phoneOs => _phoneOs;
  String? get osVersion => _osVersion;
  String? get isMarchant => _isMarchant;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Msisdn'] = _msisdn;
    map['DestinationMsisdn'] = _destinationMsisdn;
    map['DestinationMsisdnPrefix'] = _destinationMsisdnPrefix;
    map['ReferenceId'] = _referenceId;
    map['Keyword'] = _keyword;
    map['Currency'] = _currency;
    map['Amount'] = _amount;
    map['Pin'] = _pin;
    map['FullName'] = _fullName;
    map['AppVersion'] = _appVersion;
    map['PhoneBrand'] = _phoneBrand;
    map['PhoneOs'] = _phoneOs;
    map['OsVersion'] = _osVersion;
    map['IsMarchant'] = _isMarchant;
    return map;
  }

}