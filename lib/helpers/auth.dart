import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:rush_alert/helpers/utils.dart';
import 'package:rush_alert/screens/onboarding/auth/otp.dart';

import '../screens/onboarding/auth/location.dart';

class Authenticate {

  static verifyPhone({required BuildContext context, required Map<String, dynamic> data, process}) {
    fb.FirebaseAuth _auth = fb.FirebaseAuth.instance;
    _auth.verifyPhoneNumber(
      phoneNumber: data['phone'],
      codeSent: (verificationId, forceResendingToken) {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OTP(
                  data: data,
                  verificationId: verificationId,
              )),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      timeout: const Duration(seconds: 60),
      verificationCompleted: (fb.AuthCredential authCredential) async {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Location()),
        );

      },
      verificationFailed: (authException) {
        print("verification failed");
        Navigator.pop(context);
        print(authException.message ?? "Something went wrong");
        Utils.showToast( Colors.red,  "verification failed");
      },
    );
  }

  static verifyCode(BuildContext context, String verificationId, String code, dynamic data, currentLocation, townName) {
      fb.FirebaseAuth auth = fb.FirebaseAuth.instance;
      fb.AuthCredential credential = fb.PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: code);
    auth.signInWithCredential(credential).catchError((error) {
      Navigator.pop(context);
      Utils.showToast( Colors.red, error.message ?? "Something went wrong");
    }).then((value) async {
      // Navigator.pop(context);
      // Utils.loadingProgress(context);
      Navigator.of(context).pop();
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Location(location: currentLocation, town: townName, data: data,)));

    });
  }

}