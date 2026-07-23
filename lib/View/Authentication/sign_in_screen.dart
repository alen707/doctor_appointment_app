import 'package:docter_appointment_app/Service/sign_in_api.dart';
import 'package:docter_appointment_app/View/Authentication/componets/input_button.dart';
import 'package:docter_appointment_app/View/Authentication/componets/input_field.dart';
import 'package:docter_appointment_app/View/Authentication/componets/other_login.dart';
import 'package:docter_appointment_app/View/Authentication/forget_password_screen.dart';
import 'package:docter_appointment_app/View/Authentication/login_screen.dart';
import 'package:docter_appointment_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  @override
  void initState() {
  super.initState();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}
@override
void dispose() {

  emailcontroller.dispose();
  passwordcontroller.dispose();
  super.dispose();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only( left: 25, right: 25,bottom: 30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                child: Column(
                  children: [
                    Image.asset("assets/images/logo.png"),
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
                  ],
                ),
              ),

              //SizedBox(height: 10),

              //SizedBox(height: 30),
              Column(
                children: [
                  Text(
                    AppLocalizations.of(context)!.hi,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                AppLocalizations.of(context)!.hiDiscription,
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
                ],
              ),

              //SizedBox(height: 10),
              

              //SizedBox(height: 15),
              InputField(
                hind: AppLocalizations.of(context)!.yourMail,
                icon: Icons.email,
                controller: emailcontroller,
              ),
              InputField(
                hind: AppLocalizations.of(context)!.password,
                icon: Icons.password,
                controller: passwordcontroller,
              ),

              //SizedBox(height: 15),
              InputButton(
                inputText: AppLocalizations.of(context)!.signin,

                nextpage: () async {
                    await SignInApi().signInApi(context,emailcontroller.text,passwordcontroller.text

                   );
                },
                //nextpage: () =>
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => const MyHomePage(),
                //   ),
                // ),
              ),

              //SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 1,
                        //width: double.infinity,
                        color: Colors.grey,
                      ),
                    ),
                  ),

                  Text(
                    "or",
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 1,
                        //width: double.infinity,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),

              //SizedBox(height: 20),
              OtherLogin(
                logo: "assets/images/google_logo.png",
                platform: AppLocalizations.of(context)!.google,
              ),

              //SizedBox(height: 20),
              OtherLogin(
                logo: "assets/images/facebook_logo.png",
                platform: AppLocalizations.of(context)!.facebook,
              ),

              //SizedBox(height: 20),
              Column(
               
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ForgetPasswordScreen(),
                        ),
                      );
                    },
                    child: Text(
                      AppLocalizations.of(context)!.forgetPasswordHi,
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
              
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppLocalizations.of(context)!.signupdiscription),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        child: Text(
                          AppLocalizations.of(context)!.signin,
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
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
