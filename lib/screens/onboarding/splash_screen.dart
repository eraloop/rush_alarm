import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rush_alert/helpers/colors.dart';
import 'package:rush_alert/helpers/permissions.dart';
import 'package:rush_alert/helpers/sessions.dart';
import 'package:rush_alert/screens/home.dart';
import 'package:rush_alert/screens/onboarding/auth/phone.dart';
import 'package:rush_alert/screens/onboarding/onboarding.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late bool isFirstTime;
  late bool isLoggenIn;
  late bool isProfile;

  @override
  void initState() {
    super.initState();
    permissionServiceHandler();
  }

  Future<void> permissionServiceHandler() async {
    var status = await Permissions().locationPermission();
    if(status){
      await navigateBasedOnSession();
    }
  }

  navigateBasedOnSession() async {
    SessionManager ss = SessionManager();
    bool isFirstTime = await ss.isFirstTime();
    bool isLoggedIn = await ss.getLogin();
    bool isProfileComplete = await ss.getProfileSetup();

    Timer(const Duration(seconds: 3), () {
      if (isFirstTime) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const Onboarding()),
              (route) => false,
        );
      } else {
       if(isLoggedIn){
         Navigator.pushAndRemoveUntil(
           context,
           MaterialPageRoute(builder: (context) => Home()),
               (route) => false,
         );
       }else{
         Navigator.pushAndRemoveUntil(
           context,
           MaterialPageRoute(builder: (context) => Phone()),
               (route) => false,
         );
       }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorUtils.Blue,
        height: double.infinity,
        width: double.infinity,
        child: Image.asset("assets/images/spalshscreen.png", fit: BoxFit.cover)
      ),
    );
  }
}
