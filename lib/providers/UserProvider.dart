
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:rush_alert/helpers/sessions.dart';
import 'package:rush_alert/models/user.dart';
import 'package:rush_alert/network/network.dart';

class UserProvider with ChangeNotifier{

  User? _user;
  String? _token;
  bool _isLoggedIn = false;

  User? get user => _user;
  String? get token => _token;
  bool get isLoggedIn => _isLoggedIn;


  Future<dynamic> login(Map<String, dynamic> userData) async {
    const String url = 'auth/login';
    var fcm_token = await SessionManager().getFcmTokens();
    final Map<String, dynamic> data = {
      'phone': userData['phone'],
      'longitude': userData['longitude'],
      'latitude': userData['latitude'],
      'fcm_token': fcm_token ?? '',
    };
    print(data);
    try {
      final response = await Network.multipart(endpoint: url, data: data);
      _isLoggedIn = true;
      _token = response['token'];
      SessionManager ss = SessionManager();
      ss.setToken(_token!);
      ss.setLogin(true);
      return true;
    } catch (error) {
      print(error);
    }
  }

  Future<dynamic> register(Map<String, dynamic> userData) async {
    const String url = 'user/signup';
    var fcm_token = await SessionManager().getFcmTokens();

    final Map<String, dynamic> data = {
      'phone': userData['phone'],
      'longitude': userData['longitude'],
      'latitude': userData['latitude'],
      'fcm_token': fcm_token ?? '',
    };
    try {
      print(data);
      final response = await Network.post(endpoint: url, data: json.encode(data));
      print("register done $response");
      _token = response['token'];
      SessionManager ss = SessionManager();
      ss.setToken(_token!);
      ss.setLogin(true);
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }


  Future<dynamic> getUserInfo() async {
    const String url = 'user/profile';
    try {
      final response = await Network.get(url);
      _user = User.fromJson(response['user']);
      await SessionManager().saveUser(_user!.toJson());
      notifyListeners();
      return "user retrieved successfully";
    } catch (error) {
      print(error);
    }
  }

}