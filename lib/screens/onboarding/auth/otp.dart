import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:rush_alert/components/widgets/customTextButton.dart';
import 'package:rush_alert/helpers/auth.dart';
import 'package:rush_alert/helpers/colors.dart';
import 'package:rush_alert/helpers/utils.dart';
import 'package:rush_alert/screens/onboarding/auth/location.dart';

class OTP extends StatefulWidget {
  const OTP({ this.verificationId,  this.data});
  final verificationId;
  final data;

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  final formKey = GlobalKey<FormState>();
  FocusNode phoneFocusNode = FocusNode();
  late LatLng _currentPosition;
  var townName = '';

  getCurrentPosition() async {
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      print(position);
      setState(() => _currentPosition = LatLng(position.latitude, position.longitude),);
    }).catchError((e) {
      debugPrint(e);
    });

    List<Placemark> placemarks = await placemarkFromCoordinates(
      _currentPosition.latitude,
      _currentPosition.longitude,
    );
    setState(() {
      if (placemarks.isNotEmpty) {
        townName = placemarks[0].locality ?? 'Unknown';
      } else {
        townName = 'Unknown';
      }
    });
  }

  @override
  initState() {
    super.initState();
    getCurrentPosition();
  }

  var code ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: SizedBox(
                height: 350,
                width: double.infinity,
                child: FittedBox(
                  child: Image.asset("assets/images/signup-vrification-img.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
              child: Text('Signup with phone number',
                style: Theme.of(context).textTheme.headline2?.copyWith(
                    color: ColorUtils.DarkGrey,
                    fontWeight: FontWeight.w700
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 5),
              child: Text('Sign up to get realtime location tracking and many more',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1
              ),
            ),

            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15),
                    child: PinCodeTextField(
                      appContext: context,
                      useHapticFeedback: true,
                      pastedTextStyle: TextStyle(
                        color: ColorUtils.DeepWhitishGrey,
                        fontWeight: FontWeight.w500,
                        fontSize: 30,
                      ),
                      length: 6,
                      obscureText: false,
                      blinkWhenObscuring: false,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 60,
                        fieldWidth: 45,
                        selectedColor: ColorUtils.Green,
                        inactiveColor: ColorUtils.DarkWhitishGrey,
                        inactiveFillColor: Colors.grey,
                        activeFillColor: ColorUtils.Green,
                        disabledColor: ColorUtils.DarkWhitishGrey,
                        activeColor: ColorUtils.Green,
                        activeBorderWidth: 2,
                        inactiveBorderWidth: 2,
                        selectedBorderWidth: 2,
                        selectedFillColor: ColorUtils.DarkWhitishGrey,
                      ),
                      animationDuration: const Duration(milliseconds: 300),
                      keyboardType: TextInputType.number,
                      onCompleted: (v) {},
                      onChanged: (value) {
                        code = value;
                      },
                      beforeTextPaste: (text) {
                        return true;
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only( top: 10, right: 10, left: 10),
                    child: TextButton(
                        onPressed: code == '' ? null : () {
                          widget.data['longitude'] = _currentPosition.longitude;
                          widget.data['latitude'] = _currentPosition.latitude;

                          Utils.loadingProgress(context);
                          Authenticate.verifyCode(context, widget.verificationId, code, widget.data, _currentPosition, townName);
                        },
                        style: ButtonStyle(
                          overlayColor: MaterialStateColor.resolveWith((states) => Colors.transparent),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric( vertical: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: code == '' ? ColorUtils.DarkWhitishGrey: ColorUtils.Green,
                          ),
                          child: Text("Continue",
                              style:  Theme.of(context).textTheme.headline5?.copyWith(
                                  color:  Colors.white
                              )
                          ),
                        )),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
