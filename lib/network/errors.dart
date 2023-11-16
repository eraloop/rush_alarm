import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rush_alert/helpers/colors.dart';
import 'package:rush_alert/helpers/utils.dart';

class NetworkErrors {
  static void handleNetworkErrors(http.Response response) {
    final result = json.decode(response.body);
    print(response.statusCode);
    if (response.statusCode == 404) {
      Utils.showToast(Colors.red, result['message'] ?? 'Account not found, please create an account');
    } else if (response.statusCode == 400) {
      Utils.showToast(Colors.red, result['message'] ?? 'Please provide all fields');
    } else if (response.statusCode == 401) {
      Utils.showToast(Colors.red, result['message'] ?? 'Unauthenticated');
    } else if(response.statusCode == 310){
      Utils.showToast(ColorUtils.Orange, result['message'] ?? 'Email not verified');
    } else if (response.statusCode == 500) {
      // navigatorKey.currentState?.pop();
      Utils.showToast(Colors.red, result['message'] ?? 'Something went wrong');
    } else {
      Utils.showToast(Colors.red, 'Something happened, try again');
    }
  }

  static handleRequestErrors(message){
    final error = json.decode(message);
    Utils.showToast(Colors.red, error ?? 'Something went wrong');
  }
}