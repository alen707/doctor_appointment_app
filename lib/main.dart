
import 'package:docter_appointment_app/View/Authentication/sign_in_screen.dart';
import 'package:docter_appointment_app/View/first_loading_screen.dart';
import 'package:docter_appointment_app/ViewModal/language_provider.dart';
import 'package:docter_appointment_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';


void main() async {
    WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
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
      //home: SignInScreen(),
    );
  }
}

