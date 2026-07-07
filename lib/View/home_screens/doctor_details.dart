import 'package:docter_appointment_app/Modal/docter_details_modal.dart';
import 'package:docter_appointment_app/Service/docter_details_api.dart';
import 'package:docter_appointment_app/View/Authentication/componets/input_button.dart';
import 'package:docter_appointment_app/View/home_screens/book_appointment_screen.dart';
import 'package:docter_appointment_app/View/home_screens/components/doctor_details_badge.dart';
import 'package:docter_appointment_app/View/home_screens/components/doctor_details_review.dart';
import 'package:docter_appointment_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class DoctorDetails extends StatefulWidget {
  const DoctorDetails({super.key});

  @override
  State<DoctorDetails> createState() => _DocterDetailsState();
}

class _DocterDetailsState extends State<DoctorDetails> {
  final DocterDetailApi docterDetailApi = DocterDetailApi();
  DocterDetailsModal? docter;
  @override
  void initState() {
    super.initState();
    loadDoctor();
  }

  Future<void> loadDoctor() async {
    final data = await docterDetailApi.getDocterDetails();

    if (!mounted) return;

    setState(() {
      docter = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            AppLocalizations.of(context)!.docdetails,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: ImageIcon(AssetImage("assets/icon/Like-icon.png")),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    //height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade400,
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 109,
                                width: 109,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),

                                  image: DecorationImage(
                                    image: AssetImage(
                                      "assets/images/skip_screen_image_c.png",
                                    ),
                                  ),
                                ),
                              ),

                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,

                                    children: [
                                      Text(
                                        docter?.data.name ?? "error",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                      SizedBox(height: 1),
                                      Divider(color: Colors.grey),

                                      SizedBox(height: 1),
                                      Text(
                                        docter?.data.specialization ?? "",
                                        style: TextStyle(
                                          color: Colors.grey.shade700,

                                          fontSize: 14,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.location_on,
                                            color: Colors.grey.shade500,
                                          ),
                                          Expanded(
                                            child: Text(
                                              docter?.data.location ?? "",
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: Colors.grey.shade500,

                                                fontSize: 14,
                                                decoration: TextDecoration.none,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DoctorDetailsBadge(
                        icon: AssetImage(
                          "assets/icon/docter_badge_pationts.png",
                        ),
                        data: docter?.data.patientsCount ?? "",
                        title: AppLocalizations.of(context)!.patients,
                      ),
                      DoctorDetailsBadge(
                        icon: AssetImage("assets/icon/docter_detail_medal.png"),
                        data: docter?.data.experienceYears.toString() ?? "",
                        title: AppLocalizations.of(context)!.experience,
                      ),
                      DoctorDetailsBadge(
                        icon: AssetImage(
                          "assets/icon/docter_details_rating.png",
                        ),
                        data: docter?.data.rating.toString() ?? "",
                        title: AppLocalizations.of(context)!.rating,
                      ),
                      DoctorDetailsBadge(
                        icon: AssetImage(
                          "assets/icon/docter_details_reviews.png",
                        ),
                        data: docter?.data.reviewsCount.toString() ?? "",
                        title: AppLocalizations.of(context)!.reviews,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),

                  Text(
                    AppLocalizations.of(context)!.aboutme,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    docter?.data.about ?? "",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),

                  SizedBox(height: 10),

                  Text(
                    AppLocalizations.of(context)!.workingtime,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        docter?.data.workingTime.days ?? "",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      Text(
                        ",",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      Text(
                        docter?.data.workingTime.startTime ?? "",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      Text(
                        " - ",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      Text(
                        docter?.data.workingTime.endTime ?? "",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.reviewsss,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          AppLocalizations.of(context)!.seeall,
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),

                  ListView.builder(
                    itemCount: docter?.data.reviews.length ?? 0,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return DoctorDetailsReviews(
                        name: docter?.data.reviews[index].patientName ?? "",
                        reviews: docter?.data.reviews[index].review ?? "",
                        rating: docter?.data.reviews[index].rating ?? 0.0,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,

            child: InputButton(
              inputText: AppLocalizations.of(context)!.bookappointment,
              nextpage: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookAppointmentScreen(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
