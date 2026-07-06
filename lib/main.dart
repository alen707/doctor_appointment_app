import 'package:docter_appointment_app/View/Authentication/edit_profile_screen.dart';
import 'package:docter_appointment_app/View/Authentication/forget_password_screen.dart';
import 'package:docter_appointment_app/View/Authentication/login_screen.dart';
import 'package:docter_appointment_app/View/Authentication/new_password_screen.dart';
import 'package:docter_appointment_app/View/Authentication/otp_screen.dart';
import 'package:docter_appointment_app/View/Authentication/signin_screen.dart';
import 'package:docter_appointment_app/View/SkipPages/skip_screen2.dart';
import 'package:docter_appointment_app/View/SkipPages/skip_screen3.dart';
import 'package:docter_appointment_app/View/first_loading_screen.dart';
import 'package:docter_appointment_app/View/home_screens/book_appoinment_screen.dart';
import 'package:docter_appointment_app/View/home_screens/componets/docter_card.dart';
import 'package:docter_appointment_app/View/home_screens/docter_details.dart';
import 'package:docter_appointment_app/View/home_screens/docter_search_screen.dart';
import 'package:docter_appointment_app/View/home_screens/favorites_layout.dart';
import 'package:docter_appointment_app/View/home_screens/home_layout.dart';
import 'package:docter_appointment_app/View/home_screens/home_screen.dart';
import 'package:docter_appointment_app/View/SkipPages/skip_screen1.dart';
import 'package:docter_appointment_app/View/home_screens/location_screen.dart';
import 'package:docter_appointment_app/ViewModal/langage_sheredpteference.dart';
import 'package:docter_appointment_app/ViewModal/language_provider.dart';
import 'package:docter_appointment_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => LanguageProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  @override
  
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,

      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate
      ],

      supportedLocales: const[
        Locale("en"),
        Locale("fa")
      ],

     locale: languageProvider.locale,
       //home: const MyHomePage(),
      home: FirstLoadingScreen(),
     //home: SkipScreenA(),
      //home: LoginScreen(),
       //home: SignUpScreen(),
       //home: ForgetPasswordScreen(),
      //home: OtpScreen(),
      //home: NewPasswordScreen(),
      //home: EditProfileScreen(),
      //home: LocationScreen(),
      //home: HomeLayout(),
      //home: DocterCard(),
      //home: FavoritesLayout(),
      //home: DocterDetails(),
      //home: BookAppoinmentScreen(),
      //home: DocterSearchScreen(),
    );
  }
}

