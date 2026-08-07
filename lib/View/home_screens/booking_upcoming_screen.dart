import 'package:docter_appointment_app/Modal/booking_modal.dart';
import 'package:docter_appointment_app/View/home_screens/components/doctor_card.dart';
import 'package:docter_appointment_app/ViewModal/doctor_provider.dart';
import 'package:docter_appointment_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookingUpcomingScreen extends StatefulWidget {
  const BookingUpcomingScreen({super.key});

  @override
  State<BookingUpcomingScreen> createState() => _BookingUpcomingScreen();
}

class _BookingUpcomingScreen extends State<BookingUpcomingScreen> {
  //final BookingApi bookingApi = BookingApi();
  List<BookingModal> bookingList = [];
  @override
  void initState() {
    super.initState();
    loadDoctor();
  }

  Future<void> loadDoctor() async {
    //bookingList = await bookingApi.getbookingApi();
    bookingList= await context.read<DoctorProvider>().docterCardProvider();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(
        
      ),
      child: ListView.builder(
        padding: EdgeInsets.only(
          top:20
        ),
        shrinkWrap: true,
        itemCount: bookingList.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(
            // top: 10,
             left: 25,
             right: 25,
             bottom: 20
          ),
          child: DoctorCard(
            blackButten: AppLocalizations.of(context)!.reschedule,
            greyButten: AppLocalizations.of(context)!.cancel,
            date: bookingList[index].date,
            dep: bookingList[index].specialization,
            location: bookingList[index].location,
            name: bookingList[index].doctorName,
            time: bookingList[index].time,
            hospital: bookingList[index].hospital,
          ),
        ),
      ),
    );
  }
}
