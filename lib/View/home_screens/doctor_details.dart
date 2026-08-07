import 'package:docter_appointment_app/Modal/docter_details_modal.dart';
import 'package:docter_appointment_app/View/Authentication/componets/input_button.dart';
import 'package:docter_appointment_app/View/home_screens/book_appointment_screen.dart';
import 'package:docter_appointment_app/View/home_screens/components/docter_detail_card.dart';
import 'package:docter_appointment_app/View/home_screens/components/doctor_details_badge.dart';
import 'package:docter_appointment_app/View/home_screens/components/doctor_details_review.dart';
import 'package:docter_appointment_app/ViewModal/doctor_provider.dart';
import 'package:docter_appointment_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DoctorDetails extends StatefulWidget {
  const DoctorDetails({super.key});

  @override
  State<DoctorDetails> createState() => _DocterDetailsState();
}

class _DocterDetailsState extends State<DoctorDetails> {
  //final DocterDetailApi docterDetailApi = DocterDetailApi();
  DocterDetailsModal? docter;
  bool isExpanded = false;
  double fontSize = 16;
  double lineHeight = 1.5;
  bool reviewcount = false;
  @override
  void initState() {
    super.initState();
    loadDoctor();
  }

  Future<void> loadDoctor() async {
    docter = await context.read<DoctorProvider>().docterDetailsProvider();
    setState(() {});
    // final data = await docterDetailApi.getDocterDetails();

    // if (!mounted) return;

    // setState(() {
    //   docter = data;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,

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
                  DocterDtetailCard(docter: docter),

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
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedSize(
                        duration: const Duration(milliseconds: 300),
                        child: SizedBox(
                          height: isExpanded
                              ? null
                              : fontSize * lineHeight * 2.5, // 👈 2.5 lines
                          child: ClipRect(
                            child: Text(
                              docter?.data.about ?? "",
                              style: const TextStyle(
                                fontSize: 16,
                                height: 1.25,
                                color: Color.fromARGB(255, 138, 137, 137),
                              ),
                            ),
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isExpanded = !isExpanded;
                          });
                        },
                        child: Text(
                          isExpanded ? "View less" : "View more",
                          style: const TextStyle(
                            decoration: TextDecoration.underline,

                            color: Colors.black,
                            //fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10),

                  Text(
                    AppLocalizations.of(context)!.workingtime,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        docter?.data.workingTime.days ?? "",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      Text(
                        ",",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      Text(
                        docter?.data.workingTime.startTime ?? "",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      Text(
                        " - ",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      Text(
                        docter?.data.workingTime.endTime ?? "",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade600,
                        ),
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
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            reviewcount = !reviewcount;
                          });
                        },
                        child: Text(
                          AppLocalizations.of(context)!.seeall,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                    ],
                  ),

                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: reviewcount
                        ? docter?.data.reviews.length ?? 0
                        : 1,
                    // docter?.data.reviews.length ?? 0 :,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: DoctorDetailsReviews(
                          name: docter?.data.reviews[index].patientName ?? "",
                          reviews: docter?.data.reviews[index].review ?? "",
                          rating: docter?.data.reviews[index].rating ?? 0.0,
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 20,),

                  InputButton(
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
                ],
              ),
            ),
          ),
          // Positioned(
          //   bottom: 50,
          //   left: 20,
          //   right: 20,

          //   child:
          //    InputButton(
          //     inputText: AppLocalizations.of(context)!.bookappointment,
          //     nextpage: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => BookAppointmentScreen(),
          //         ),
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
