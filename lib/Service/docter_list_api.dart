import 'dart:convert';

import 'package:docter_appointment_app/Modal/docters_list_modal.dart';
import 'package:http/http.dart' as http;

class DocterListApi {
  Future<List<DocterListModal>> getDocterListApi() async {
    final response = await http.get(
      Uri.parse("https://www.jsonkeeper.com/b/JH8F9"),
      headers: {
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);

      return jsonData
          .map((e) => DocterListModal.fromJson(e))
          .toList();
    } else {
      throw Exception("Failed to load doctor details");
    }
  }
}