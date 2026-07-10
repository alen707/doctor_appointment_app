import 'package:docter_appointment_app/Modal/hospital_list_modal.dart';
import 'package:docter_appointment_app/Service/hospital_list_api.dart';
import 'package:docter_appointment_app/View/home_screens/components/medical_centers.dart';
import 'package:docter_appointment_app/View/home_screens/components/search_field.dart';
import 'package:docter_appointment_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  static const LatLng _clinicLocation = LatLng(10.8505, 76.2711);
  static const CameraPosition _initialCamera = CameraPosition(
    target: _clinicLocation,
    zoom: 14.5, // Zoom level (higher means closer to the streets)
  );
  final HospitalListApi hospitalListApi = HospitalListApi();
  List<HospitalModel> hospitallist = [];
  @override
  void initState() {
    super.initState();
    loadDoctor();
  }

  Future<void> loadDoctor() async {
    hospitallist = await hospitalListApi.getHospitalListApi();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: _initialCamera,
              zoomControlsEnabled: true,
            ),

            Positioned(
              top: 100, // Distance from the bottom of the screen
              left: 20, // Distance from the left edge
              right:
                  20, // Distance from the right edge -> This forces it to stretch responsively!
              child: SearchField(
                title: AppLocalizations.of(context)!.searchdochos,
                onChanged: (value) {
                  
                },
              ),
            ),

            Positioned(
              bottom: 75,
              left: 0,
              right: 0,
              child: SizedBox(
                height: 260,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  //shrinkWrap: true,
                  itemCount: hospitallist.length,
                  itemBuilder: (context, index) => MedicalCenters(
                    width: 300,
                    location:
                        "${hospitallist[index].address}, ${hospitallist[index].city}",
                    name: hospitallist[index].name,
                    rating: hospitallist[index].rating,
                    reviewcount: hospitallist[index].reviews,
                    distance: hospitallist[index].distance,
                    time: hospitallist[index].duration,
                    type: hospitallist[index].type,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
