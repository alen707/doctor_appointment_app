import 'package:docter_appointment_app/Modal/booking_modal.dart';
import 'package:docter_appointment_app/Service/booking_api.dart';
import 'package:docter_appointment_app/View/home_screens/componets/docter_card.dart';
import 'package:docter_appointment_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class BookingCompletedScreen extends StatefulWidget {
  const BookingCompletedScreen({super.key});

  @override
  State<BookingCompletedScreen> createState() => _BookingCompletedLayoutState();
}

class _BookingCompletedLayoutState extends State<BookingCompletedScreen> {
  final BookingApi bookingApi = BookingApi();
  List<BookingModal> bookingList = [];
  @override
  void initState() {
    super.initState();
    loadDoctor();
  }

  Future<void> loadDoctor() async {
    bookingList = await bookingApi.getbookingApi();

    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Container(
  color: Colors.white,
  padding: const EdgeInsets.all(15),
  child: 
    
       ListView.builder(
    shrinkWrap:true ,
    itemCount: bookingList.length,
    itemBuilder: (context, index) =>DocterCard(
            blackButten:AppLocalizations.of(context)!.addreview ,
        greyButten: AppLocalizations.of(context)!.rebook,
      date: bookingList[index].date,
      dep: bookingList[index].specialization,
      location: bookingList[index].location,
      name: bookingList[index].doctorName,
      time: bookingList[index].time,
      hospital: bookingList[index].hospital ,

      ), 
  
  
  
    ),
      
            
    
  
);
  }
}