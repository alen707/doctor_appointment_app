import 'package:docter_appointment_app/View/home_screens/booking_completed_screen.dart';
import 'package:docter_appointment_app/View/home_screens/booking_upcoming_screen.dart';
import 'package:docter_appointment_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class BookingScreenLayout extends StatefulWidget {
  const BookingScreenLayout({super.key});

  @override
  State<BookingScreenLayout> createState() => _BookingScreenLayoutState();
}

class _BookingScreenLayoutState extends State<BookingScreenLayout> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,

          backgroundColor: Colors.white,

          title: Center(
            child: Text(
              AppLocalizations.of(context)!.mybookings,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          bottom: TabBar(
            tabs: [
              Tab(text: AppLocalizations.of(context)!.upcoming),
              Tab(text: AppLocalizations.of(context)!.completed),
              Tab(text: AppLocalizations.of(context)!.canceled),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            BookingUpcomingScreen(),
            BookingCompletedScreen(),
            Center(child: Text(' Screen')),
          ],
        ),
      ),
    );
  }
}
