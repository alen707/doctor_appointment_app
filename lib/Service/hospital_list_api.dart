import 'dart:convert';

import 'package:docter_appointment_app/Modal/hospital_list_modal.dart';
import 'package:http/http.dart' as http;

class HospitalListApi {
  Future<List<HospitalModel>> getHospitalListApi() async {
    final response = await http.get(
      Uri.parse("https://www.jsonkeeper.com/b/RQVIW"),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);

      return jsonData.map((e) => HospitalModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load doctor details");
    }
  }
}
