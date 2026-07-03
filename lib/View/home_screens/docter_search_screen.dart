import 'package:docter_appointment_app/Modal/docters_list_modal.dart';
import 'package:docter_appointment_app/Service/docter_list_api.dart';
import 'package:docter_appointment_app/View/home_screens/componets/docter_list_data.dart';
import 'package:docter_appointment_app/View/home_screens/componets/filter_button.dart';
import 'package:docter_appointment_app/View/home_screens/componets/search_feild.dart';
import 'package:docter_appointment_app/View/home_screens/docter_details.dart';
import 'package:docter_appointment_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class DocterSearchScreen extends StatefulWidget {
  const DocterSearchScreen({super.key});

  @override
  State<DocterSearchScreen> createState() => _DocterSearchScreenState();
}

class _DocterSearchScreenState extends State<DocterSearchScreen> {
    final DocterListApi docterDetailApi=DocterListApi();
  List <DocterListModal> docterlist=[];
  @override
  void initState() {
    super.initState();
    loadDoctor();
  }
  Future<void>loadDoctor()async{

    docterlist= await docterDetailApi.getDocterListApi();
    setState(() {});

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
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
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
              SearchFeild(title: AppLocalizations.of(context)!.searchdoc,),

              SizedBox(height: 15),

              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: filters.length,

                  itemBuilder: (context, index) {
                    return FilterButen(title: filters[index]);
                  },
                ),
              ),
              SizedBox(height: 5),

              Row(
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
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),

                      Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                    ],
                  ),
                ],
              ),

              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: docterlist.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DocterListData(

                        name: docterlist[index].name,
                        catogary: docterlist[index].specialization,
                        location: docterlist[index].hospital,
                        rating: docterlist[index].rating,
                        reviewcount: docterlist[index].reviews,





                        ontap: (){
                          Navigator.push(context, 
                          MaterialPageRoute(builder: (context) => DocterDetails(),));
                        }




                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
