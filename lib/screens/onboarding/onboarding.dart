import 'package:flutter/material.dart';
import 'package:rush_alert/helpers/colors.dart';
import 'package:rush_alert/helpers/sessions.dart';
import 'package:rush_alert/models/onboarding.dart';
import 'package:rush_alert/screens/onboarding/auth/phone.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {

  var currentIndex = 0;
  var previousIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: PageView.builder(
          controller: _controller,
          itemCount: content.length,
          onPageChanged: (int i) {
            setState(() {
              previousIndex = currentIndex;
              currentIndex = i;
            });
          },
          itemBuilder: (context, i) =>
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget> [

                  SizedBox(
                    height: 350,
                    width: double.infinity,
                    child: FittedBox(
                      child: Image.asset(content[i].image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 5),
                        child: Text(content[i].title,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline1
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 5),
                        child: Text(content[i].content,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyText1
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center ,
                          children: [
                            buildDot(currentIndex == 0, currentIndex > 0),
                            buildDot(currentIndex == 1, currentIndex > 1),
                            buildDot(currentIndex == 2, currentIndex > 2),
                          ],
                        ),
                      ),

                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: TextButton(
                        onPressed: () async{
                          if(currentIndex == 2)  {
                            await SessionManager().setFirstTime(false);
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Phone()));
                          }
                          else{
                            _controller.animateToPage(currentIndex + 1, duration: const Duration(milliseconds: 300), curve: Curves.bounceIn);
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color:  ColorUtils.Green,
                          ),
                          child: Text(content[i].buttonText,
                            style: Theme.of(context).textTheme.headline5?.copyWith(
                                color: ColorUtils.White,
                              fontSize: 18
                            ) ,
                          ),
                        )),
                  ),

                ],
              ) ,
        ));
  }

  Widget buildDot(bool isActive, bool passed) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        height:  20 ,
        width: 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isActive  ? ColorUtils.Green : ColorUtils.DarkWhitishGrey,)
    );
  }
}
