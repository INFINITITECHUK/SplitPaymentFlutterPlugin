/*
{
"Keyword": "CASH",
"DestinationFullName": "Dip KumarDas",
"DestinationMsisdn": "12222233334",
"CurrentBalance": 0,
"ChargeAmount": 0.1,
"ChargePayer": 0,
"CommissionAmount": 0.75,
"CommissionReceiver": 0,
"ConvertedAmount": "5",
"Rate": "0",
"Amount": "5",
"RewardPoint": 0,
"ReferenceId": "",
"AttemptLeft": "0",
"Msisdn": "11234567883",
"ResponseCode": 100,
"ResposeDescription": "OK",
"ResposeDescriptionLocal": "",
"TransactionId": "0",
"data": {
"Passwordmatch": true,
"AccountStatus": 0
}
}
*/
class GetAmlResponseModel {
  GetAmlResponseModel({
    String? keyword,
    String? destinationFullName,
    String? destUserImage,
    String? destinationMsisdn,
    num? currentBalance,
    num? chargeAmount,
    num? chargePayer,
    num? commissionAmount,
    num? commissionReceiver,
    String? convertedAmount,
    String? rate,
    String? amount,
    num? rewardPoint,
    String? referenceId,
    String? attemptLeft,
    String? msisdn,
    int? responseCode,
    String? responseDescription,
    String? responseDescriptionLocal,
    dynamic transactionId,
    // PinCheckData? data,
  }){
    _keyword = keyword;
    _destinationFullName = destinationFullName;
    _destinationMsisdn = destinationMsisdn;
    _currentBalance = currentBalance;
    _chargeAmount = chargeAmount;
    _chargePayer = chargePayer;
    _commissionAmount = commissionAmount;
    _commissionReceiver = commissionReceiver;
    _convertedAmount = convertedAmount;
    _rate = rate;
    _amount = amount;
    _rewardPoint = rewardPoint;
    _referenceId = referenceId;
    _attemptLeft = attemptLeft;
    _msisdn = msisdn;
    _responseCode = responseCode;
    _responseDescription = responseDescription;
    _responseDescriptionLocal = responseDescriptionLocal;
    _transactionId = transactionId;
    // _data = data;
    _destUserImage=destUserImage;
  }

  GetAmlResponseModel.fromJson(dynamic json) {
    _keyword = json['Keyword'];
    _destinationFullName = json['DestinationFullName'];
    _destinationMsisdn = json['DestinationMsisdn'];
    _currentBalance = json['CurrentBalance'];
    _chargeAmount = json['ChargeAmount'];
    _chargePayer = json['ChargePayer'];
    _commissionAmount = json['CommissionAmount'];
    _commissionReceiver = json['CommissionReceiver'];
    _convertedAmount = json['ConvertedAmount'];
    _rate = json['Rate'];
    _amount = json['Amount'];
    _rewardPoint = json['RewardPoint'];
    _referenceId = json['ReferenceId'];
    _attemptLeft = json['AttemptLeft'];
    _msisdn = json['Msisdn'];
    _responseCode = json['ResponseCode'];
    _responseDescription = json['ResponseDescription'];
    _responseDescriptionLocal = json['ResponseDescriptionLocal'];
    _transactionId = json['TransactionId'];
    // _data = json['data'];
    _destUserImage=json["DestUserImage"];
  }


  String? _keyword;
  String? _destinationFullName;
  String? _destinationMsisdn;
  num? _currentBalance;
  num? _chargeAmount;
  num? _chargePayer;
  num? _commissionAmount;
  num? _commissionReceiver;
  String? _convertedAmount;
  String? _rate;
  String? _amount;
  num? _rewardPoint;
  dynamic _referenceId;
  String? _attemptLeft;
  String? _msisdn;
  int? _responseCode;
  String? _responseDescription;
  String? _responseDescriptionLocal;
  dynamic _transactionId;
  // PinCheckData? _data;
  String? _destUserImage;

  String? get keyword => _keyword;
  String? get destinationFullName => _destinationFullName;
  String? get destinationMsisdn => _destinationMsisdn;
  num? get currentBalance => _currentBalance;
  num? get chargeAmount => _chargeAmount;
  num? get chargePayer => _chargePayer;
  num? get commissionAmount => _commissionAmount;
  num? get commissionReceiver => _commissionReceiver;
  String? get convertedAmount => _convertedAmount;
  String? get rate => _rate;
  String? get amount => _amount;
  num? get rewardPoint => _rewardPoint;
  dynamic get referenceId => _referenceId;
  String? get attemptLeft => _attemptLeft;
  String? get msisdn => _msisdn;
  int? get responseCode => _responseCode;
  String? get responseDescription => _responseDescription;
  String? get responseDescriptionLocal => _responseDescriptionLocal;
  dynamic get transactionId => _transactionId;
  // PinCheckData? get data => _data;
  String? get destUserImage => _destUserImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Keyword'] = _keyword;
    map['DestinationFullName'] = _destinationFullName;
    map['DestinationMsisdn'] = _destinationMsisdn;
    map['CurrentBalance'] = _currentBalance;
    map['ChargeAmount'] = _chargeAmount;
    map['ChargePayer'] = _chargePayer;
    map['CommissionAmount'] = _commissionAmount;
    map['CommissionReceiver'] = _commissionReceiver;
    map['ConvertedAmount'] = _convertedAmount;
    map['Rate'] = _rate;
    map['Amount'] = _amount;
    map['RewardPoint'] = _rewardPoint;
    map['ReferenceId'] = _referenceId;
    map['AttemptLeft'] = _attemptLeft;
    map['Msisdn'] = _msisdn;
    map['ResponseCode'] = _responseCode;
    map['ResponseDescription'] = _responseDescription;
    map['ResponseDescriptionLocal'] = _responseDescriptionLocal;
    map['TransactionId'] = _transactionId;
    // map['data'] = _data;
    map['DestUserImage'] = _destUserImage;
    return map;
  }

}

class PinCheckData {
  final bool passwordMatch;
  final int accountStatus;

  PinCheckData({
    required this.passwordMatch,
    required this.accountStatus,
  });

  factory PinCheckData.fromJson(Map<String, dynamic> json) {
    return PinCheckData(
      passwordMatch: json['Passwordmatch'] ?? false,
      accountStatus: json['AccountStatus'] ?? 0,
    );
  }
}