
import 'package:flutter/cupertino.dart';
import 'package:rush_alert/models/notification.dart';
import 'package:rush_alert/network/network.dart';


class NotificationProvider with ChangeNotifier {
  List<NotificationModel> _notifications = [];
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  List<NotificationModel> get notifications => _notifications;

  void updateNotificationModel(NotificationModel notification){
    print("NotificationModel in provider, ${notification}");
    _notifications.add(notification);
    notifyListeners();
  }

  Future<dynamic> getNotifications() async {
    const String url = 'notifications';
    try{
      _isLoading = true;
      _notifications = [];
      final response = await Network.get(url);
      if(response['status'] == 'success'){
        var notifications = response['data'];
        notifications.forEach((notification) {
          _notifications.add(NotificationModel.fromJson(notification));
        });
        _isLoading = false;
        notifyListeners();
        return;
      }
    }catch(e){
      print(e);
    }
  }

}