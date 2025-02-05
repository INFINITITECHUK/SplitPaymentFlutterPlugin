/// SOURCEMSISDN : "211111111111"
/// DESTMSISDN : "123456789999"
/// KEYWORD : "SEND"
/// AMOUNT : "5"
/// PIN : "123456"
/// LANG : "ENG"
class TransferBody {
  TransferBody({
    String? sourcemsisdn,
    String? referenceId,
    String? destmsisdn,
    String? keyword,
    String? amount,
    String? pin,
    String? lang,}){
    _sourcemsisdn = sourcemsisdn;
    _destmsisdn = destmsisdn;
    _referenceId = referenceId;
    _keyword = keyword;
    _amount = amount;
    _pin = pin;
    _lang = lang;
  }

  TransferBody.fromJson(dynamic json) {
    _sourcemsisdn = json['SOURCEMSISDN'];
    _destmsisdn = json['DESTMSISDN'];
    _referenceId = json['REFERENCEID'];
    _keyword = json['KEYWORD'];
    _amount = json['AMOUNT'];
    _pin = json['PIN'];
    _lang = json['LANG'];
  }
  String? _sourcemsisdn;
  String? _destmsisdn;
  String? _referenceId;
  String? _keyword;
  String? _amount;
  String? _pin;
  String? _lang;
  TransferBody copyWith({  String? sourcemsisdn,
    String? destmsisdn,
    String? keyword,
    String? referenceId,
    String? amount,
    String? pin,
    String? lang,
  }) => TransferBody(  sourcemsisdn: sourcemsisdn ?? _sourcemsisdn,
    destmsisdn: destmsisdn ?? _destmsisdn,
    keyword: keyword ?? _keyword,
    referenceId: referenceId ?? _referenceId,
    amount: amount ?? _amount,
    pin: pin ?? _pin,
    lang: lang ?? _lang,
  );
  String? get sourcemsisdn => _sourcemsisdn;
  String? get destmsisdn => _destmsisdn;
  String? get referenceId => _referenceId;
  String? get keyword => _keyword;
  String? get amount => _amount;
  String? get pin => _pin;
  String? get lang => _lang;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['SOURCEMSISDN'] = _sourcemsisdn;
    map['DESTMSISDN'] = _destmsisdn;
    map['REFERENCEID'] = _referenceId;
    map['KEYWORD'] = _keyword;
    map['AMOUNT'] = _amount;
    map['PIN'] = _pin;
    map['LANG'] = _lang;
    return map;
  }

}