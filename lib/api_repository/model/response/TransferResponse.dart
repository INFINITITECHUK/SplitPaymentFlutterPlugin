/// TransactionId : ""
/// ResponseCode : 100
/// ResponseDescription : ""
/// issuccess : true
/// statusCode : 404
/// message : ""

class TransferResponse {
  TransferResponse({
      this.transactionId, 
      this.responseCode, 
      this.responseDescription, 
      this.issuccess, 
      this.statusCode, 
      this.message,});

  TransferResponse.fromJson(dynamic json) {
    transactionId = json['TransactionId'];
    responseCode = json['ResponseCode'];
    responseDescription = json['ResponseDescription'];
    issuccess = json['issuccess'];
    statusCode = json['statusCode'];
    message = json['message'];
  }
  String? transactionId;
  num? responseCode;
  String? responseDescription;
  bool? issuccess;
  num? statusCode;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['TransactionId'] = transactionId;
    map['ResponseCode'] = responseCode;
    map['ResponseDescription'] = responseDescription;
    map['issuccess'] = issuccess;
    map['statusCode'] = statusCode;
    map['message'] = message;
    return map;
  }

}