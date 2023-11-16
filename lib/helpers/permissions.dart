import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rush_alert/helpers/colors.dart';
import 'package:rush_alert/helpers/utils.dart';

class Permissions {

   Future<dynamic> locationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    print("serviceEnabled $serviceEnabled");

    // if (!serviceEnabled) {
    //   print("serviceEnabled $serviceEnabled");
    //   WidgetsBinding.instance?.addPostFrameCallback((_) async {
    //     print(" before dialog serviceEnabled $serviceEnabled");
    //     await Dialogs.enableLocationService(context);
    //     print("after dialog serviceEnabled $serviceEnabled");
    //   });
    //   Utils.showToast(Colors.black, 'Location services are disabled. Please enable the services');
    //   return false;
    // }

    permission = (await Geolocator.checkPermission());
    if (permission == LocationPermission.denied) {
      // SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      permission = (await Geolocator.requestPermission());
      if (permission == LocationPermission.denied) {
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        Utils.showToast(ColorUtils.Red, "Location permissions are denied");
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      permission = (await Geolocator.requestPermission());
      if (permission == LocationPermission.denied) {
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        Utils.showToast(ColorUtils.Red, "Location permissions are denied");
        return false;
      }
    }

    return true;
  }

}