import 'dart:convert';

import 'package:docter_appointment_app/Modal/booking_modal.dart';

import 'package:http/http.dart' as http;

class BookingApi {
  Future<List<BookingModal>> getbookingApi() async {
    final response = await http.get(
      Uri.parse("https://www.jsonkeeper.com/b/MM9SB"),
      headers: {
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);

      return jsonData
          .map((e) => BookingModal.fromJson(e))
          .toList();
    } else {
      throw Exception("Failed to load doctor details");
    }
  }
}