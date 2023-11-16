import 'package:flutter/material.dart';
import 'package:rush_alert/helpers/colors.dart';
import 'package:rush_alert/helpers/dialogs.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/logo/logo2.png",
          height: 40,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ColorUtils.Green),
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 3.0, horizontal: 20),
                          child: Text(
                            'Welcome',
                            style: Theme.of(context)
                                .textTheme
                                .headline2
                                ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                          ),
                          child: Text(
                            "Analice Borga",
                            style: Theme.of(context)
                                .textTheme
                                .headline1
                                ?.copyWith(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    )),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                child: Text('Call For Help Emergencies',
                  style: Theme.of(context).textTheme.headline2?.copyWith(
                      color: ColorUtils.DarkGrey,
                      fontWeight: FontWeight.w700
                  ),
                ),
              ),
              GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 0.9,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0),
                children: [
                  TextButton(
                    onPressed: () {
                      Dialogs.showConfirmationDialog(context: context, mainText: "Alarm Everyone", subText: 'Are you sure', buttonOneText: 'No, False Alarm', buttonTwoText: 'Alarm People',
                        icon: "assets/icons/fire-alarm-img.png",
                      );
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => icons[index]['page']));
                    },
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Colors.transparent),
                    ),
                    child: Container(
                      // height: 100,
                      height: double.infinity,
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          width: 1,
                          color: ColorUtils.DarkGrey
                        )
                        // color: Utils.WhiteGreenGreyColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/icons/earthquake-img.png",
                            height: 80,
                            width: 80,
                          ),
                          Text(
                            'Earthquake',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline3,
                          )
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => icons[index]['page']));
                    },
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Colors.transparent),
                    ),
                    child: Container(
                      // height: 100,
                      height: double.infinity,
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              width: 1,
                              color: ColorUtils.DarkGrey
                          )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/icons/earthquake-img.png",
                            height: 80,
                            width: 80,
                          ),
                          Text(
                            'Earthquake',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline3,
                          )
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => icons[index]['page']));
                    },
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Colors.transparent),
                    ),
                    child: Container(
                      // height: 100,
                      height: double.infinity,
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              width: 1,
                              color: ColorUtils.DarkGrey
                          )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/icons/earthquake-img.png",
                            height: 80,
                            width: 80,
                          ),
                          Text(
                            'Earthquake',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline3,
                          )
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => icons[index]['page']));
                    },
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Colors.transparent),
                    ),
                    child: Container(
                      // height: 100,
                      height: double.infinity,
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              width: 1,
                              color: ColorUtils.DarkGrey
                          )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/icons/earthquake-img.png",
                            height: 80,
                            width: 80,
                          ),
                          Text(
                            'Earthquake',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline3,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 30,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                child: Text('Your Emergencies',
                  style: Theme.of(context).textTheme.headline2?.copyWith(
                      color: ColorUtils.DarkGrey,
                      fontWeight: FontWeight.w700
                  ),
                ),
              ),
              GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 0.9,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0),
                children: [
                  TextButton(
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => icons[index]['page']));
                    },
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Colors.transparent),
                    ),
                    child: Container(
                      // height: 100,
                      height: double.infinity,
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              width: 1,
                              color: ColorUtils.DarkGrey
                          )
                        // color: Utils.WhiteGreenGreyColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/icons/earthquake-img.png",
                            height: 80,
                            width: 80,
                          ),
                          Text(
                            'Earthquake',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline3,
                          )
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => icons[index]['page']));
                    },
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Colors.transparent),
                    ),
                    child: Container(
                      // height: 100,
                      height: double.infinity,
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              width: 1,
                              color: ColorUtils.DarkGrey
                          )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/icons/earthquake-img.png",
                            height: 80,
                            width: 80,
                          ),
                          Text(
                            'Earthquake',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline3,
                          )
                        ],
                      ),
                    ),
                  ),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
