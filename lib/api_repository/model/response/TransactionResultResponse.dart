/// TransactionDate : ""
/// StatusCode : 0
/// StatusMsg : ""
/// CurrentBalance : 0.0
/// RewardPoint : 0
/// ChargeAmount : 0.0
/// ChargePayer : ""
/// CommissionAmount : 0.0
/// CommissionReceiver : ""
/// RewardReceiver : ""
/// TransactionAmount : 0.0
/// StatusMsgLocal : ""
/// ExtraNotification : ""
/// ResponseCode : 0
/// ResponseDescription : ""
/// ResponseDescriptionLocal : ""
/// TransactionId : ""
/// data : ""
/// IsSuccess : false
/// Message : ""

class TransactionResultResponse {
  TransactionResultResponse({
      this.transactionDate, 
      this.statusCode, 
      this.statusMsg, 
      this.currentBalance, 
      this.rewardPoint, 
      this.chargeAmount, 
      this.chargePayer, 
      this.commissionAmount, 
      this.commissionReceiver, 
      this.rewardReceiver, 
      this.transactionAmount, 
      this.statusMsgLocal, 
      this.extraNotification, 
      this.responseCode, 
      this.responseDescription, 
      this.responseDescriptionLocal, 
      this.transactionId, 
      this.data, 
      this.isSuccess, 
      this.message,});

  TransactionResultResponse.fromJson(dynamic json) {
    transactionDate = json['TransactionDate'];
    statusCode = json['StatusCode'];
    statusMsg = json['StatusMsg'];
    currentBalance = json['CurrentBalance'];
    rewardPoint = json['RewardPoint'];
    chargeAmount = json['ChargeAmount'];
    chargePayer = json['ChargePayer'];
    commissionAmount = json['CommissionAmount'];
    commissionReceiver = json['CommissionReceiver'];
    rewardReceiver = json['RewardReceiver'];
    transactionAmount = json['TransactionAmount'];
    statusMsgLocal = json['StatusMsgLocal'];
    extraNotification = json['ExtraNotification'];
    responseCode = json['ResponseCode'];
    responseDescription = json['ResponseDescription'];
    responseDescriptionLocal = json['ResponseDescriptionLocal'];
    transactionId = json['TransactionId'];
    data = json['data'];
    isSuccess = json['IsSuccess'];
    message = json['Message'];
  }
  String? transactionDate;
  num? statusCode;
  String? statusMsg;
  num? currentBalance;
  num? rewardPoint;
  num? chargeAmount;
  String? chargePayer;
  num? commissionAmount;
  String? commissionReceiver;
  String? rewardReceiver;
  num? transactionAmount;
  String? statusMsgLocal;
  String? extraNotification;
  num? responseCode;
  String? responseDescription;
  String? responseDescriptionLocal;
  String? transactionId;
  String? data;
  bool? isSuccess;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['TransactionDate'] = transactionDate;
    map['StatusCode'] = statusCode;
    map['StatusMsg'] = statusMsg;
    map['CurrentBalance'] = currentBalance;
    map['RewardPoint'] = rewardPoint;
    map['ChargeAmount'] = chargeAmount;
    map['ChargePayer'] = chargePayer;
    map['CommissionAmount'] = commissionAmount;
    map['CommissionReceiver'] = commissionReceiver;
    map['RewardReceiver'] = rewardReceiver;
    map['TransactionAmount'] = transactionAmount;
    map['StatusMsgLocal'] = statusMsgLocal;
    map['ExtraNotification'] = extraNotification;
    map['ResponseCode'] = responseCode;
    map['ResponseDescription'] = responseDescription;
    map['ResponseDescriptionLocal'] = responseDescriptionLocal;
    map['TransactionId'] = transactionId;
    map['data'] = data;
    map['IsSuccess'] = isSuccess;
    map['Message'] = message;
    return map;
  }

}