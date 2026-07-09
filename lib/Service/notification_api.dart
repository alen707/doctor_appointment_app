import 'dart:convert';

import 'package:docter_appointment_app/Modal/notification_modal.dart';
import 'package:http/http.dart' as http;

class NotificationApi {
  Future<List<NotificationModal>> getNotificationApi() async {
    final response = await http.get(
      Uri.parse("https://www.jsonkeeper.com/b/F1ZKC"),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = jsonDecode(response.body);

      return [NotificationModal.fromJson(jsonData)];
    } else {
      throw Exception("Failed to load notification details");
    }
  }
}