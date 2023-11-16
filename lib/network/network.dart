import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rush_alert/helpers/sessions.dart';
import 'package:rush_alert/helpers/utils.dart';
import 'package:rush_alert/network/errors.dart';
import 'package:rush_alert/network/network_utils.dart';

const String baseUrl = "https://code-battle-4dabfab863b2.herokuapp.com/api/v1/";

class Network {

  static Future<dynamic> get(endpoint) async {

    if(await NetworkUtils.hasNetwork()){
      var url = Uri.parse(baseUrl + endpoint);
      print("endpoint in get $url");
      try {
        var response = await http.get(url, headers: await NetworkUtils.headers());
        var body = json.decode(response.body);
        if(body['status'] == 1){
          return  json.decode(response.body);
        } else{
          NetworkErrors.handleNetworkErrors(response);
        }
      } catch (e, stackTrace) {
        print(stackTrace);
      }
    } else{
      Utils.showToast(Colors.black, "No Internet Connection");
    }
  }

  static Future<dynamic> post({required String endpoint, dynamic data}) async {
    if(await NetworkUtils.hasNetwork()){
      var url = Uri.parse(baseUrl + endpoint);
      try {
        var response = await http.post(url, headers: await NetworkUtils.headers(), body: data);
        print(response.body);
        print(response.statusCode);
        var body = json.decode(response.body);
        if(body['status'] == 1){
          return json.decode(response.body);
        } else{
          NetworkErrors.handleNetworkErrors(response);
        }
      } catch (e, stackTrace) {
        print(stackTrace);
        // Utils.showToast(Colors.red, "Request failed");
      }
    }else{
      Utils.showToast(Colors.black, "No Internet Connection");
    }

  }

  static Future<dynamic> multipart({required String endpoint, dynamic data}) async{
    if(await NetworkUtils.hasNetwork()){
      var fcm_token = await SessionManager().getFcmTokens();
      print(fcm_token);
      var url = Uri.parse(baseUrl + endpoint);
      try {
        var request = http.MultipartRequest('POST', url);
        request.headers.addAll( await NetworkUtils.headers());
        request.fields['phone'] = data['phone'] ?? '';
        request.fields['longitude'] = data['longitude'] ?? '';
        request.fields['latitude'] = data['latitude'] ?? '';

        request.files.add( http.MultipartFile.fromString("fcm_token" , fcm_token ?? ''));

        var result = await request.send();
        var response = await http.Response.fromStream(result);
        print("response from the bk ${response.body}");

        var body = json.decode(response.body);
        if(body['status'] == 1){
          return json.decode(response.body);
        } else{
          NetworkErrors.handleNetworkErrors(response);
        }

      } catch (e, stackTrace) {
        print(stackTrace);
        Utils.showToast(Colors.red, 'Request failed');
      }
    }else{
      Utils.showToast(Colors.black, "No Internet Connection");
    }
  }
}