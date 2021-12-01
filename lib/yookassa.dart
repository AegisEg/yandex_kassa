import 'dart:async';

import 'package:flutter/services.dart';
import 'package:yookassa_flutter_sdk/models/payment_parameters.dart';
import 'package:yookassa_flutter_sdk/yookassa_module.dart';

class YooKassa {
  static const MethodChannel _channel =
      const MethodChannel('yookassa_flutter_sdk');

  static Future<TokenizationResult> startCheckout(
          PaymentParameters paymentParameters) async =>
      TokenizationResult.fromJson(
          await _channel.invokeMapMethod<String, dynamic>(
              'startCheckout', paymentParameters.json) as Map<String, dynamic>);

  static Future<TokenizationResult> startCheckoutWithCvcRepeatRequest(
          PaymentParameters paymentParameters, String paymentId) async =>
      TokenizationResult.fromJson(
          await _channel.invokeMapMethod<String, dynamic>(
                  'startCheckoutWithCvcRepeatRequest',
                  paymentParameters.json..addAll({"paymentId": paymentId}))
              as Map<String, dynamic>);

  static Future<dynamic> confirm3dsCheckout(
          PaymentParameters paymentParameters, Uri confirmationUrl) async =>
      TokenizationResult.fromJson(
          await _channel.invokeMapMethod<String, dynamic>(
                  'confirm3dsCheckout',
                  paymentParameters.json
                    ..addAll({"confirmationUrl": confirmationUrl.toString()}))
              as Map<String, dynamic>);
}
