import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rush_alert/helpers/sessions.dart';


class FirebaseNotification {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  final _androidChannel = const AndroidNotificationChannel(
      "high_importance_channel",
      "High Importance Notification",
      description: 'This channel is used for important notifications',
      importance: Importance.defaultImportance
  );

  final FlutterLocalNotificationsPlugin _localNotification = FlutterLocalNotificationsPlugin();

  Future<void> handleBackgroundMessaging(RemoteMessage message) async {
    // var date = Dates.formatStringDateMDY(message!.sentTime.toString());
    // var time = Dates.formatStringTimeHm(message!.sentTime.toString());
    //
    // final notification = NotificationModel(
    //     image: message?.data['image'],
    //     title: message?.notification?.title,
    //     body: message?.notification?.body,
    //     time: time,
    //     date: date
    // );
    // NotificationProvider().updateNotification(notification);
    //
    // if(message == null) return ;
    // navigatorKey.currentState?.push(
    //   MaterialPageRoute(
    //     builder: (context) => const HomeNav(index: 3),
    //   ),
    // );
  }

  Future<dynamic> handleMessage(RemoteMessage? message) async {

    // var date = Dates.formatStringDateMDY(message!.sentTime.toString());
    // var time = Dates.formatStringTimeHm(message!.sentTime.toString());
    //
    // final notification = NotificationModel(
    //   image: message?.data['image'],
    //   title: message?.notification?.title,
    //   body: message?.notification?.body,
    //   time: time,
    //   date: date
    // );

    // NotificationProvider().updateNotification(notification);
    //
    // if(message == null) return ;
    // navigatorKey.currentState?.push(
    //   MaterialPageRoute(
    //     builder: (context) => const HomeNav(index: 3),
    //   ),
    // );
  }

  Future<void> initPushNotifications() async {
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessaging);
    FirebaseMessaging.onMessage.listen((message){
      final notifications = message.notification;
      if(notifications == null) return;
      _localNotification.show(
        notifications.hashCode,
        notifications.title,
        notifications.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            _androidChannel.id,
            _androidChannel.name,
            channelDescription: _androidChannel.description,
            icon: "@drawable/launcher_icon"
          )
        ),
        payload: jsonEncode(message.toMap())
      );
    });
  }

  Future initLocalNotifications() async {
    const iOS = IOSInitializationSettings(
      onDidReceiveLocalNotification: null,
    );
    const android = AndroidInitializationSettings("@drawable/launcher_icon");
    const settings = InitializationSettings(android: android, iOS: iOS);
    await _localNotification.initialize(
        settings,
        onSelectNotification: (payload){
          final message = RemoteMessage.fromMap(jsonDecode(payload!));
          print("firebase enotification message $message");
          handleMessage(message);
        }
    );
    await _localNotification
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_androidChannel);
  }

  Future<void> initNotifications() async {
    String? token = await _firebaseMessaging.getToken();
    await FirebaseMessaging.instance.setAutoInitEnabled(true);
    await SessionManager().saveFcmTokens(token!);
    initPushNotifications();
    initLocalNotifications();
  }

}