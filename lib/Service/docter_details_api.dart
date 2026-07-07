import 'dart:convert';

import 'package:docter_appointment_app/Modal/docter_details_modal.dart';
import 'package:http/http.dart' as http;

class DocterDetailApi {
  Future<DocterDetailsModal> getDocterDetails() async {
    final response = await http.get(
      Uri.parse("https://www.jsonkeeper.com/b/V9IDQ"),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      return DocterDetailsModal.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load doctor details");
    }
  }
}
