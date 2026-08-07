import 'package:docter_appointment_app/Modal/docters_list_modal.dart';
import 'package:docter_appointment_app/View/home_screens/components/doctor_list_data.dart';
import 'package:docter_appointment_app/View/home_screens/components/filter_button.dart';
import 'package:docter_appointment_app/View/home_screens/components/search_field.dart';
import 'package:docter_appointment_app/View/home_screens/doctor_details.dart';
import 'package:docter_appointment_app/ViewModal/doctor_provider.dart';
import 'package:docter_appointment_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DoctorSearchScreen extends StatefulWidget {
  const DoctorSearchScreen({super.key});

  @override
  State<DoctorSearchScreen> createState() => _DocterSearchScreenState();
}

class _DocterSearchScreenState extends State<DoctorSearchScreen> {
  //final DocterListApi docterDetailApi = DocterListApi();
  List<DocterListModal> doctorlist = [];
  List<DocterListModal> searchDoctors = [];
  List<DocterListModal> filteredDoctors = [];
  int selectedindex = 0;
  @override
  void initState() {
    super.initState();
    loadDoctor();
  }

  Future<void> loadDoctor() async {
    //doctorlist = await docterDetailApi.getDocterListApi();
    doctorlist = await context.read<DoctorProvider>().docterListProvider();
    searchDoctors = List.from(doctorlist);
    filteredDoctors = List.from(doctorlist);

    setState(() {});
  }

  void searchDoctor(String value) {
    setState(() {
      if (value.isEmpty) {
        searchDoctors = List.from(filteredDoctors);
      } else {
        searchDoctors = filteredDoctors.where((doctor) {
          return doctor.name.toLowerCase().contains(value.toLowerCase()) ||
              doctor.specialization.toLowerCase().contains(
                value.toLowerCase(),
              ) ||
              doctor.hospital.toLowerCase().contains(value.toLowerCase());
        }).toList();
      }
    });
  }

  void filterDoctor(int index) {
    setState(() {
      selectedindex = index;

      if (index == 0) {
        filteredDoctors = List.from(doctorlist);
      } else if (index == 1) {
        filteredDoctors = doctorlist.where((doctor) {
          return doctor.specialization.toLowerCase() == "dentistry";
        }).toList();
      } else if (index == 2) {
        filteredDoctors = doctorlist.where((doctor) {
          return doctor.specialization.toLowerCase() == "cardiology";
        }).toList();
      } else if (index == 3) {
        filteredDoctors = doctorlist.where((doctor) {
          return doctor.specialization.toLowerCase() == "pulmonology";
        }).toList();
      } else if (index == 4) {
        filteredDoctors = doctorlist.where((doctor) {
          return doctor.specialization.toLowerCase() == "general";
        }).toList();
      } else if (index == 5) {
        filteredDoctors = doctorlist.where((doctor) {
          return doctor.specialization.toLowerCase() == "neurology";
        }).toList();
      }
      searchDoctors = List.from(filteredDoctors);
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> filters = [
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context)!.dentistry,
      AppLocalizations.of(context)!.cardio,
      AppLocalizations.of(context)!.pulmono,
      AppLocalizations.of(context)!.general,
      AppLocalizations.of(context)!.neurology,
    ];
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
              child: Column(
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            AppLocalizations.of(context)!.alldocters,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              inherit: false,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(width: 30),
                    ],
                  ),

                  SearchField(
                    title: AppLocalizations.of(context)!.searchdoc,
                    onChanged: searchDoctor,
                  ),

                  SizedBox(height: 15),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: filters.length,

                  itemBuilder: (context, index) {
                    return FilterButen(
                      title: filters[index],
                      index: index,
                      ontap: () {
                        filterDoctor(index);
                      },
                      selectedindex: selectedindex,
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 5),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.found,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),

                  Row(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.defalt,
                        style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                      ),

                      ImageIcon(AssetImage("assets/icon/arrow.png"),color: Colors.grey.shade700,)
                    ],
                  ),
                ],
              ),
            ),

            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(bottom: 20),
                shrinkWrap: true,
                itemCount: searchDoctors.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                      left: 20,
                      right: 20,
                    ),
                    child: DoctorListData(
                      name: searchDoctors[index].name,
                      categary: searchDoctors[index].specialization,
                      location: searchDoctors[index].hospital,
                      rating: searchDoctors[index].rating,
                      reviewcount: searchDoctors[index].reviews,

                      ontap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DoctorDetails(),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
