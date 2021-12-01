import 'package:yookassa_flutter_sdk/models/currency.dart';

import 'json_encodable.dart';

class Amount implements JsonEncodable {
  final Currency currency;
  final double value;
  Amount(this.value, {this.currency = Currency.rub});

  factory Amount.fromJson(Map json) {
    return Amount(json['value'], currency: Currency(json['currency']));
  }

  @override
  Map<String, dynamic> get json => {'currency': currency.json, 'value': value}
    ..removeWhere((key, val) => val == null);

  Map<String, dynamic> get jsonIso4217 => {
        'currency': currency.json,
        'value': value
      }..removeWhere((key, val) => val == null);

  @override
  String toString() => json.toString();
}
