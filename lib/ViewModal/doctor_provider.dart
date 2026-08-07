import 'package:docter_appointment_app/Modal/booking_modal.dart';
import 'package:docter_appointment_app/Modal/docter_details_modal.dart';
import 'package:docter_appointment_app/Modal/docters_list_modal.dart';
import 'package:docter_appointment_app/Service/booking_api.dart';
import 'package:docter_appointment_app/Service/docter_details_api.dart';
import 'package:docter_appointment_app/Service/docter_list_api.dart';
import 'package:flutter/material.dart';

class DoctorProvider extends ChangeNotifier {
  List<DocterListModal> docterList = [];
 DocterDetailsModal ?docterdetail;
 List<BookingModal> docterBookingList=[];

  Future<List<DocterListModal>> docterListProvider() async {
    DocterListApi docterListApi = DocterListApi();

    docterList = await docterListApi.getDocterListApi();
    notifyListeners();

    return docterList;
  }
    Future<DocterDetailsModal?> docterDetailsProvider() async {
      DocterDetailApi docterDetailApi=DocterDetailApi();
      docterdetail= await docterDetailApi.getDocterDetails();

    notifyListeners();

    return docterdetail;
  }

  Future<List<BookingModal>> docterCardProvider() async {
    BookingApi bookingApi=BookingApi();
    docterBookingList=await bookingApi.getbookingApi();
      

    notifyListeners();

    return docterBookingList;
  }
  
}
