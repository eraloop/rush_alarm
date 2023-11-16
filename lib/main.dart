import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rush_alert/firebase_options.dart';
import 'package:rush_alert/helpers/firebase_notifications.dart';
import 'package:rush_alert/helpers/darkTheme.dart';
import 'package:rush_alert/providers/NotificationProvider.dart';
import 'package:rush_alert/providers/UserProvider.dart';
import 'package:rush_alert/screens/onboarding/auth/location.dart';
import 'package:rush_alert/screens/onboarding/splash_screen.dart';
// import 'firebase_options.dart';


void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.playIntegrity,
  );
  await FirebaseNotification().initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
        ChangeNotifierProvider<NotificationProvider>(create: (_) => NotificationProvider()),
      ],
      child: MaterialApp(
        title: 'Rush Alarm',
        debugShowCheckedModeBanner: false,
          theme: theme,
          darkTheme: theme,
        home: const SplashScreen(),
      ),
    );
  }
}
