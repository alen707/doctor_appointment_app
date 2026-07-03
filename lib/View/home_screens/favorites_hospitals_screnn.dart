import 'package:docter_appointment_app/Modal/hospital_list_modal.dart';
import 'package:docter_appointment_app/Service/hospital_list_api.dart';
import 'package:docter_appointment_app/View/home_screens/componets/medical_centers.dart';
import 'package:flutter/material.dart';

class FavoritesHospitalsScrenn extends StatefulWidget {
  const FavoritesHospitalsScrenn({super.key});

  @override
  State<FavoritesHospitalsScrenn> createState() => _FavoritesHospitalsScrennState();
}

class _FavoritesHospitalsScrennState extends State<FavoritesHospitalsScrenn> {
  final HospitalListApi hospitalListApi = HospitalListApi();
  List<HospitalModel> hospitallist = [];
  @override
  void initState() {
    super.initState();
    loadDoctor();
  }

  Future<void> loadDoctor() async {
    hospitallist = await hospitalListApi.getHospitalListApi() ;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(15),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: hospitallist.length,
        itemBuilder: (context, index) => MadicalCenters(
          wid: double.infinity,
          location: "${hospitallist[index].address}, ${hospitallist[index].city}",
          name: hospitallist[index].name,
          rating: hospitallist[index].rating,
          reviewcount: hospitallist[index].reviews,
          distance: hospitallist[index].distance,
          time: hospitallist[index].duration,
          type: hospitallist[index].type,
          
          ) ,
        
        ),
    );
  }
}