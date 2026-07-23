import 'dart:ffi';

import 'package:docter_appointment_app/View/Authentication/componets/input_button.dart';
import 'package:docter_appointment_app/View/Authentication/new_password_screen.dart';
import 'package:docter_appointment_app/l10n/app_localizations.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<OtpScreen> {
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
                AppLocalizations.of(context)!.verifyCode,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10),

              Text(
                AppLocalizations.of(context)!.verifyCodeDiscription,
                style: TextStyle(fontSize: 15, color: Colors.grey),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 15),

              LayoutBuilder(
                builder: (context, constraints) {
                  const int fields = 5;
                  const double spacing = 10;

                  final double fieldWidth =
                      (constraints.maxWidth - (fields - 1) * spacing) / fields;

                  return OtpTextField(
                    fillColor: Colors.grey,
                    numberOfFields: 5,
                    showFieldAsBox: true,
                    borderColor: Colors.grey.shade100,
                    fieldWidth: fieldWidth,
                    fieldHeight: fieldWidth,
                    borderRadius: BorderRadius.circular(15),
                  );
                },
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: InputButton(
                  inputText: AppLocalizations.of(context)!.verify,
                  nextpage: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const NewPasswordScreen(),
                    ),
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppLocalizations.of(context)!.resendDiscriprion),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      AppLocalizations.of(context)!.resend,
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
