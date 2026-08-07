import 'package:docter_appointment_app/Modal/hospital_list_modal.dart';
import 'package:docter_appointment_app/Service/hospital_list_api.dart';
import 'package:flutter/material.dart';

class HospitalProvider extends ChangeNotifier {
  List<HospitalModel> hospitalList = [];

  Future<List<HospitalModel>> hospitalProvider() async {
    HospitalListApi hospitalListApi = HospitalListApi();
    hospitalList = await hospitalListApi.getHospitalListApi();

    notifyListeners();
    return hospitalList;
  }
}
