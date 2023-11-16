import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:rush_alert/helpers/auth.dart';
import 'package:rush_alert/helpers/colors.dart';
import 'package:rush_alert/helpers/utils.dart';

class Phone extends StatefulWidget {
  const Phone({super.key});

  @override
  State<Phone> createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {

  final formKey = GlobalKey<FormState>();
  FocusNode phoneFocusNode = FocusNode();
  String phone = '';
  CountryCode code = CountryCode(dialCode: '+237', code: 'CM');

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

            SizedBox(
              height: 350,
              width: double.infinity,
              child: FittedBox(
                child: Image.asset("assets/images/signup-img.png",
                  fit: BoxFit.cover,
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

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: ColorUtils.DarkWhitishGrey,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 1,
                          color: ColorUtils.Grey.withOpacity(0.6)
                      )
                    ),
                    child: Row(
                      children: [
                        SizedBox( // Added SizedBox to give space for the CountryCodePicker
                          width: 100, // Adjust width according to your preference
                          child: CountryCodePicker(
                            onChanged: (value){
                              code = value!;
                              print(code);
                            },
                            initialSelection: 'CM',
                            favorite: const ['+237', 'CM'],
                            showCountryOnly: false,
                            showOnlyCountryWhenClosed: false,
                            alignLeft: false,
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            focusNode: phoneFocusNode,
                            autovalidateMode:
                            AutovalidateMode.onUserInteraction,
                            validator: (value){
                            },
                            onChanged: (value)=> setState(() {phone = value;}),
                            onSaved: (value)=> setState(() {phone = value!;}),
                            style: Theme.of(context).textTheme.headline3?.copyWith(
                                fontWeight: FontWeight.w400
                            ),
                            decoration: InputDecoration(
                                hintText: "Phone Number",
                                hintStyle: Theme.of(context).textTheme.headline3?.copyWith(
                                    fontWeight: FontWeight.w400
                                ),
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder:InputBorder.none,
                                errorBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,

                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 18),

                            ),
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only( top: 10, right: 10, left: 10),
                    child: TextButton(
                        onPressed: phone == '' ? null : () {
                          Utils.loadingProgress(context);
                          Map<String, dynamic> data = {
                            "phone":  "$code${phone.replaceFirst(RegExp(r'^(\+|)237'), '')}",
                          };
                          Authenticate.verifyPhone(context: context, data: data, process: "login");
                          // User.login(context, data);
                        },
                        style: ButtonStyle(
                          overlayColor: MaterialStateColor.resolveWith((states) => Colors.transparent),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric( vertical: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: phone == '' ? ColorUtils.DarkWhitishGrey: ColorUtils.Green,
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
