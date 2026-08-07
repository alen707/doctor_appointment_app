
import 'package:docter_appointment_app/Modal/notification_modal.dart';
import 'package:docter_appointment_app/Service/notification_api.dart';
import 'package:flutter/material.dart';

class NotificationProvider extends ChangeNotifier {
  List<NotificationModal>notifictionList = [];

  Future<List<NotificationModal>> hospitalProvider() async {
   NotificationApi notificationApi=NotificationApi();
   notifictionList=await notificationApi. getNotificationApi();

    notifyListeners();
    return notifictionList;
  }
}
