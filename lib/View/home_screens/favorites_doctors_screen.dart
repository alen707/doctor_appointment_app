import 'package:docter_appointment_app/Modal/docters_list_modal.dart';
import 'package:docter_appointment_app/Service/docter_list_api.dart';
import 'package:docter_appointment_app/View/home_screens/componets/docter_card.dart';
import 'package:docter_appointment_app/View/home_screens/componets/docter_list_data.dart';
import 'package:docter_appointment_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class FavoritesDoctorsScreen extends StatefulWidget {
  const FavoritesDoctorsScreen({super.key});

  @override
  State<FavoritesDoctorsScreen> createState() => _FavoritesDoctorsScreenState();
}

class _FavoritesDoctorsScreenState extends State<FavoritesDoctorsScreen> {
  final DocterListApi docterDetailApi = DocterListApi();
  List<DocterListModal> docterlist = [];
  @override
  void initState() {
    super.initState();
    loadDoctor();
  }

  Future<void> loadDoctor() async {
    docterlist = await docterDetailApi.getDocterListApi();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: docterlist.length,
              itemBuilder: (context, index) => 
               DocterListData(
               name: docterlist[index].name,
                          catogary: docterlist[index].specialization,
                          location: docterlist[index].hospital,
                          rating: docterlist[index].rating,
                          reviewcount: docterlist[index].reviews,
              
                ontap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                        width: double.infinity,
                        height: 350,
                        child: Column(
                          children: [
                            SizedBox(height: 30),
                            Center(
                              child: Text(
                                AppLocalizations.of(context)!.removefromfavorites,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: DocterListData(
                                ontap: () {},
                               name: docterlist[index].name,
                          catogary: docterlist[index].specialization,
                          location: docterlist[index].hospital,
                          rating: docterlist[index].rating,
                          reviewcount: docterlist[index].reviews,
              
                              ),
                            ),
              
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                                left: 20,
                                right: 20,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.grey.shade300,
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        AppLocalizations.of(context)!.cancel,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Expanded(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black,
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        AppLocalizations.of(context)!.rebook,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            // SizedBox(height: 10,),
            // DocterListData(),
            // SizedBox(height: 10,),
            // DocterListData(),
          ],
        ),
      ),
    );
  }
}
