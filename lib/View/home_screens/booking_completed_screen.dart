import 'package:docter_appointment_app/Modal/booking_modal.dart';
import 'package:docter_appointment_app/View/home_screens/components/doctor_card.dart';
import 'package:docter_appointment_app/ViewModal/doctor_provider.dart';
import 'package:docter_appointment_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class BookingCompletedScreen extends StatefulWidget {
  const BookingCompletedScreen({super.key});

  @override
  State<BookingCompletedScreen> createState() => _BookingCompletedLayoutState();
}

class _BookingCompletedLayoutState extends State<BookingCompletedScreen> {
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
      
      child: ListView.builder(
        padding: EdgeInsets.only(
          top: 20
        ),
        shrinkWrap: true,
        itemCount: bookingList.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(
            left: 25,
            right: 25,
            bottom: 20
          ),
          child: DoctorCard(
            blackButten: AppLocalizations.of(context)!.addreview,
            greyButten: AppLocalizations.of(context)!.rebook,
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
