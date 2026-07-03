import 'package:docter_appointment_app/Modal/hospital_list_modal.dart';
import 'package:docter_appointment_app/Service/hospital_list_api.dart';
import 'package:docter_appointment_app/View/home_screens/componets/home_title.dart';
import 'package:docter_appointment_app/View/home_screens/componets/icon_butten.dart';
import 'package:docter_appointment_app/View/home_screens/componets/medical_centers.dart';
import 'package:docter_appointment_app/View/home_screens/componets/search_feild.dart';
import 'package:docter_appointment_app/View/home_screens/docter_search_screen.dart';
import 'package:docter_appointment_app/ViewModal/langage_sheredpteference.dart';
import 'package:docter_appointment_app/ViewModal/language_provider.dart';
import 'package:docter_appointment_app/l10n/app_localizations.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:docter_appointment_app/l10n/app_localizations.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? selectedLocation = "en";
  String? value = "en";
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
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 24, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.location,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.location_on, size: 14),

                          DropdownButton(
                            value: selectedLocation,

                            items: [
                              DropdownMenuItem(
                                value: "en",
                                child: Text(
                                  "Seattle, USA",
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                              DropdownMenuItem(
                                value: "fa",
                                child: Text("دبی، امارات متحده عربی"),
                              ),
                            ],

                            onChanged: (String? value) async {
                              if (value == null) return;

                              setState(() {
                                selectedLocation = value;
                              });

                              context.read<LanguageProvider>().changeLanguage(
                                value,
                              );
                            },
                          ),
                        ],
                      ),

                      //SizedBox(width: 20,),
                      Icon(Icons.notifications),
                    ],
                  ),

                  SizedBox(height: 5),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DocterSearchScreen(),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Icon(Icons.search, color: Colors.grey),
                        SizedBox(width: 5),
                        Text(
                          AppLocalizations.of(context)!.serchDocter,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),

                  //SearchFeild(),
                  SizedBox(height: 10),

                  Container(
                    padding: EdgeInsets.zero,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 163,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    "assets/images/ads_background.png",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 25, left: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!.lockingfor,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    AppLocalizations.of(
                                      context,
                                    )!.specialistDocters,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    AppLocalizations.of(context)!.shedule,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    AppLocalizations.of(context)!.ourdoc,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Positioned(
                              bottom: 10,
                              left: 120,
                              child: DotsIndicator(
                                dotsCount: 4,
                                position: 0,
                                decorator: DotsDecorator(
                                  spacing: EdgeInsets.all(3),
                                  size: const Size.square(6.0),
                                  activeSize: const Size(30.0, 6.0),
                                  activeShape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  activeColor: Colors.white,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 1),

                        HomeTitle(
                          title: AppLocalizations.of(context)!.categosies,
                        ),

                        GridView.count(
                          padding: EdgeInsets.zero,

                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),

                          crossAxisCount: 4,
                          childAspectRatio: 1.0,
                          children: [
                            IconButten(
                              ico: AssetImage(
                                "assets/images/home_dentistry.png",
                              ),
                              text: AppLocalizations.of(context)!.dentistry,
                            ),
                            IconButten(
                              ico: AssetImage("assets/images/home_cardio.png"),
                              text: AppLocalizations.of(context)!.cardio,
                            ),
                            IconButten(
                              ico: AssetImage("assets/images/home_pulmono.png"),
                              text: AppLocalizations.of(context)!.pulmono,
                            ),
                            IconButten(
                              ico: AssetImage("assets/images/home_general.png"),
                              text: AppLocalizations.of(context)!.general,
                            ),
                            IconButten(
                              ico: AssetImage(
                                "assets/images/home_newrology.png",
                              ),
                              text: AppLocalizations.of(context)!.neurology,
                            ),
                            IconButten(
                              ico: AssetImage("assets/images/home_gastro.png"),
                              text: AppLocalizations.of(context)!.gastroen,
                            ),
                            IconButten(
                              ico: AssetImage("assets/images/home_labora.png"),
                              text: AppLocalizations.of(context)!.laborato,
                            ),
                            IconButten(
                              ico: AssetImage(
                                "assets/images/home_vaccinat.png",
                              ),
                              text: AppLocalizations.of(context)!.vaccinat,
                            ),
                          ],
                        ),
                        HomeTitle(
                          title: AppLocalizations.of(
                            context,
                          )!.nearbyMedicalCender,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
                height: 252,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  //shrinkWrap: true,
                  itemCount: hospitallist.length,
                  itemBuilder: (context, index) => MadicalCenters(
                   wid: 300,
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
          ],
        ),
      ),
    );
  }
}
