import 'package:docter_appointment_app/View/Authentication/componets/input_button.dart';
import 'package:docter_appointment_app/View/Authentication/componets/input_field.dart';
import 'package:docter_appointment_app/View/Authentication/signin_screen.dart';
import 'package:docter_appointment_app/l10n/app_localizations.dart';

import 'package:flutter/material.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<NewPasswordScreen> {
  final TextEditingController createnewpasswordcontroller =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 10,
          left: 30,
          right: 30,
        ),
        child: SingleChildScrollView(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/logo.png"),
              SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.health,
                    style: TextStyle(fontSize: 25, color: Colors.grey),
                  ),
                  Text(
                    AppLocalizations.of(context)!.pal,
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                ],
              ),

              SizedBox(height: 30),

              Text(
                AppLocalizations.of(context)!.createNewPassword,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10),

              Text(
                AppLocalizations.of(context)!.newPasswordDiscription,
                style: TextStyle(fontSize: 15, color: Colors.grey),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 15),

              InputField(
                hind: AppLocalizations.of(context)!.password,
                icon: Icons.password,
                controller: createnewpasswordcontroller,
              ),
              InputField(
                hind: AppLocalizations.of(context)!.conFormPassword,
                icon: Icons.password,
                controller: createnewpasswordcontroller,
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: InputButton(
                  inputText: AppLocalizations.of(context)!.resetPassword,
                  nextpage: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SignUpScreen(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
