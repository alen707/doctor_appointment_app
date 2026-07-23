import 'package:docter_appointment_app/View/Authentication/componets/input_button.dart';
import 'package:docter_appointment_app/View/Authentication/componets/input_field.dart';
import 'package:docter_appointment_app/View/Authentication/otp_screen.dart';
import 'package:docter_appointment_app/l10n/app_localizations.dart';

import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController forgetPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 30,
          left: 25,
          right: 25,
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
                AppLocalizations.of(context)!.forgetPassword,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10),

              Text(
                AppLocalizations.of(context)!.forgotPasswordDiscription,
                style: TextStyle(fontSize: 15, color: Colors.grey),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 15),

              InputField(
                hind: AppLocalizations.of(context)!.yourMail,
                icon: Icons.email,
                controller: forgetPassword,
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: InputButton(
                  inputText: AppLocalizations.of(context)!.sendCode,
                  nextpage: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const OtpScreen()),
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
