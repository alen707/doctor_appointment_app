import 'package:docter_appointment_app/View/home_screens/favorites_doctors_screen.dart';
import 'package:docter_appointment_app/View/home_screens/favorites_hospitals_screen.dart';
import 'package:docter_appointment_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class FavoritesLayout extends StatefulWidget {
  const FavoritesLayout({super.key});

  @override
  State<FavoritesLayout> createState() => _FavoritesLayoutState();
}

class _FavoritesLayoutState extends State<FavoritesLayout> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              AppLocalizations.of(context)!.favorites,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          bottom: TabBar(
            tabs: [
              Tab(text: AppLocalizations.of(context)!.doctors),
              Tab(text: AppLocalizations.of(context)!.hospitals),
            ],
          ),
        ),

        body: const TabBarView(
          children: [FavoritesDoctorsScreen(), FavoritesHospitalsScreen()],
        ),
      ),
    );
  }
}
