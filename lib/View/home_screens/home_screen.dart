import 'package:docter_appointment_app/Modal/hospital_list_modal.dart';
import 'package:docter_appointment_app/View/home_screens/components/home_screen_adv.dart';
import 'package:docter_appointment_app/View/home_screens/components/home_title.dart';
import 'package:docter_appointment_app/View/home_screens/components/icon_butten.dart';
import 'package:docter_appointment_app/View/home_screens/components/medical_centers.dart';
import 'package:docter_appointment_app/View/home_screens/doctor_search_screen.dart';
import 'package:docter_appointment_app/View/home_screens/notification_screen.dart';
import 'package:docter_appointment_app/ViewModal/hospital_provider.dart';
import 'package:docter_appointment_app/ViewModal/language_provider.dart';
import 'package:docter_appointment_app/l10n/app_localizations.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? selectedLocation = "en";
  String? value = "en";
  int currentindex=0;
  
  //final HospitalListApi hospitalListApi = HospitalListApi();
  List<HospitalModel> hospitallist = [];
  @override
  void initState() {
    super.initState();
    
    loadDoctor();
  }

  Future<void> loadDoctor() async {
    // hospitallist = await hospitalListApi.getHospitalListApi();
    hospitallist = await context.read<HospitalProvider>().hospitalProvider();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60, left: 20, right: 30),
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
                              //  Icon(Icons.location_on, size: 14),
                              ImageIcon(AssetImage("assets/icon/Vector .png")),
                              
        
                              DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  dropdownColor: Colors.white,
                                  
                                  
                                  value: selectedLocation,
                                        
                                  items: [
                                    DropdownMenuItem(
                                      value: "en",
                                      child: Text(
                                        "Seattle, USA",
                                        style: TextStyle(fontSize: 18),
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
                                        
                                    context
                                        .read<LanguageProvider>()
                                        .changeLanguage(value);
                                  },
                                ),
                              ),
                            ],
                          ),
        
                          //SizedBox(width: 20,),
                          //Icon(Icons.notifications),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(50)
                            ),
                            child: IconButton(
                              icon: ImageIcon(AssetImage("assets/icon/ads_background.png")),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NotificationScreen(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
        
                      SizedBox(height: 5),
        
                      ElevatedButton(
                      
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade100,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(10)
                          )

                        ),
                        
                        
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DoctorSearchScreen(),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //Icon(Icons.search, color: Colors.grey),
                            ImageIcon(AssetImage("assets/icon/search-normal.png"),size: 30,color: Colors.grey,),
                            SizedBox(width: 5),
                            Text(
                              AppLocalizations.of(context)!.serchDocter,
                              style: TextStyle(color: Colors.grey,fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
        
                //SearchFeild(),
                SizedBox(height: 10),
        
                Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: 170,
                          child: PageView(
                            
                            onPageChanged: (index) {
                              setState(() {
                                currentindex=index;
                              });
                            },
                            
                            //       controller: PageController(
                            //         viewportFraction: 0.9
                            //       ),
        
                            //       scrollDirection: Axis.horizontal,
                            children: [
                              HomeScreenAdv(),
                              HomeScreenAdv(),
                              HomeScreenAdv(),
                              HomeScreenAdv(),
                            ],
                            
                          ),
                        ),
        
                        Positioned(
                          bottom: 10,
                          left: 150,
                          child: DotsIndicator(
                            dotsCount: 4,
                            position: currentindex.toDouble(),
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
        
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        children: [
                          SizedBox(height: 1),
        
                          HomeTitle(
                            title: AppLocalizations.of(context)!.categosies,
                          ),
        
                          GridView.count(
                            padding: EdgeInsets.zero,
        
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            crossAxisSpacing: 10,
        
                            crossAxisCount: 4,
                            childAspectRatio: 0.8,
                            children: [
                              IconButten(
                                icon: AssetImage(
                                  "assets/images/home_dentistry.png",
                                ),
                                text: AppLocalizations.of(context)!.dentistry,
                              ),
                              IconButten(
                                icon: AssetImage(
                                  "assets/images/home_cardio.png",
                                ),
                                text: AppLocalizations.of(context)!.cardio,
                              ),
                              IconButten(
                                icon: AssetImage(
                                  "assets/images/home_pulmono.png",
                                ),
                                text: AppLocalizations.of(context)!.pulmono,
                              ),
                              IconButten(
                                icon: AssetImage(
                                  "assets/images/home_general.png",
                                ),
                                text: AppLocalizations.of(context)!.general,
                              ),
                              IconButten(
                                icon: AssetImage(
                                  "assets/images/home_newrology.png",
                                ),
                                text: AppLocalizations.of(context)!.neurology,
                              ),
                              IconButten(
                                icon: AssetImage(
                                  "assets/images/home_gastro.png",
                                ),
                                text: AppLocalizations.of(context)!.gastroen,
                              ),
                              IconButten(
                                icon: AssetImage(
                                  "assets/images/home_labora.png",
                                ),
                                text: AppLocalizations.of(context)!.laborato,
                              ),
                              IconButten(
                                icon: AssetImage(
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
              ],
            ),
        
            SizedBox(
              height: 252,
              child: ListView.builder(
                padding: EdgeInsets.only(right: 25,left: 15,),
        
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                //shrinkWrap: true,
                itemCount: hospitallist.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: MedicalCenters(
                    width: 250,
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
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
