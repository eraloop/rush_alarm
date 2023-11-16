import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:rush_alert/helpers/colors.dart';
class Utils {

  static showToast(Color color, String message) {
    return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 14.0,
    );
  }


  static loading(){
    return  Center(
      child: SizedBox(
        width: 20,
        height: 20,
        child:CupertinoActivityIndicator(
          color: ColorUtils.Green,
        ),
      ),
    );
  }

  static loadingProgress(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: ColorUtils.Grey.withOpacity(0.2),
        builder: (context) {
          return Center(
            child: CupertinoActivityIndicator(
              color: ColorUtils.Green,
              radius: 15,
            ),
          );
        });
  }

}