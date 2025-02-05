class TransactionResultBody {
  TransactionResultBody({
    this.appVersion,
    this.fullName,
    this.msisdn,
    this.osVersion,
    this.phoneBrand,
    this.phoneOs,
    this.transactionId,});

  TransactionResultBody.fromJson(dynamic json) {
    appVersion = json['AppVersion'];
    fullName = json['FullName'];
    msisdn = json['Msisdn'];
    osVersion = json['OsVersion'];
    phoneBrand = json['PhoneBrand'];
    phoneOs = json['PhoneOs'];
    transactionId = json['TransactionId'];
  }
  String? appVersion;
  String? fullName;
  String? msisdn;
  String? osVersion;
  String? phoneBrand;
  String? phoneOs;
  String? transactionId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['AppVersion'] = appVersion;
    map['FullName'] = fullName;
    map['Msisdn'] = msisdn;
    map['OsVersion'] = osVersion;
    map['PhoneBrand'] = phoneBrand;
    map['PhoneOs'] = phoneOs;
    map['TransactionId'] = transactionId;
    return map;
  }

}