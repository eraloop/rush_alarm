
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rush_alert/components/widgets/customTextButton.dart';
import 'package:rush_alert/helpers/colors.dart';

class Dialogs {

  static showConfirmationDialog(
      {context,
        mainText,
        subText,
        buttonOneFun,
        buttonTwoFun,
        buttonOneText,
        buttonTwoText,
        icon,
      }) async {
    return (await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Center(
            child: Container(
                alignment: Alignment.center,
                height: 300,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                        Radius.circular(20)
                    ),
                  // border: Border(
                  //   top: BorderSide(
                  //     color: Colors.red,
                  //     width: 20.0,
                  //   ),
                  // ),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Image.asset( icon ?? "assets/icons/fire-alarm-img.png", height: 60,  fit: BoxFit.contain, ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(mainText,
                          textAlign: TextAlign.center,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.headline2?.copyWith(
                          ),),
                      ),

                      Text(subText,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontWeight: FontWeight.w500
                        ),),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0),
                              child: CustomTextButton(buttonText: buttonOneText, onPress: (){ buttonOneFun(); }, textColor: Colors.red, fontWeight: FontWeight.w600, fontSize: 15, isOutlined: true, outlineColor: Colors.red, padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),  ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0),
                              child: CustomTextButton(buttonText: buttonTwoText, onPress: (){ buttonTwoFun(); }, textColor: ColorUtils.White, fontWeight: FontWeight.w600, fontSize: 15, buttonColor: Colors.red, padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10), ),
                            ),

                          ],
                        ),
                      )

                    ]
                )),
          );
        })
    ) ?? false;
  }

  static showAidDialog(
      {context,
        mainText,
        subText,
        buttonOneFun,
        buttonTwoFun,
        buttonOneText,
        buttonTwoText,
        icon,
      }) async {
    return (await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Center(
            child: Container(
                alignment: Alignment.center,
                height: 300,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                      Radius.circular(20)
                  ),
                  // border: Border(
                  //   top: BorderSide(
                  //     color: Colors.red,
                  //     width: 20.0,
                  //   ),
                  // ),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Image.asset( icon ?? "assets/icons/fire-alarm-img.png", height: 60,  fit: BoxFit.contain, ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(mainText,
                          textAlign: TextAlign.center,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.headline2?.copyWith(
                          ),),
                      ),

                      Text(subText,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontWeight: FontWeight.w500
                        ),),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0),
                              child: CustomTextButton(buttonText: buttonOneText, onPress: (){ buttonOneFun(); }, textColor: Colors.red, fontWeight: FontWeight.w600, fontSize: 15, isOutlined: true, outlineColor: Colors.red, padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),  ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0),
                              child: CustomTextButton(buttonText: buttonTwoText, onPress: (){ buttonTwoFun(); }, textColor: ColorUtils.White, fontWeight: FontWeight.w600, fontSize: 15, buttonColor: Colors.red, padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10), ),
                            ),

                          ],
                        ),
                      )

                    ]
                )),
          );
        })
    ) ?? false;
  }




}