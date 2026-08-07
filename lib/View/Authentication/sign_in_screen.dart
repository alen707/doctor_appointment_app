import 'package:docter_appointment_app/View/Authentication/componets/input_button.dart';
import 'package:docter_appointment_app/View/Authentication/componets/input_field.dart';
import 'package:docter_appointment_app/View/Authentication/componets/other_login.dart';
import 'package:docter_appointment_app/View/Authentication/forget_password_screen.dart';
import 'package:docter_appointment_app/View/Authentication/login_screen.dart';
import 'package:docter_appointment_app/ViewModal/sign_in_provider.dart';
import 'package:docter_appointment_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

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
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,

      appBar: AppBar(backgroundColor: Colors.white),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        behavior: HitTestBehavior.translucent,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(left: 25, right: 25),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  child: Column(
                    children: [
                      Image.asset("assets/images/logo.png"),
                      SizedBox(height: 10,),
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
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10,),
                    
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
                  icon: ImageIcon(AssetImage("assets/icon/sms.png"),color: Colors.grey.shade400),
                  controller: emailcontroller,
                ),
                InputField(
                  hind: AppLocalizations.of(context)!.password,
                  icon: ImageIcon(AssetImage("assets/icon/lock.png"),color: Colors.grey.shade400),
                  controller: passwordcontroller,
                ),
                    
                //SizedBox(height: 15),
                InputButton(
                  inputText: AppLocalizations.of(context)!.signin,
                    
                  nextpage: () async {
                    //await SignInApi().signInApi(context,emailcontroller.text,passwordcontroller.text);
                    
                    await context.read<SignInProvider>().signInProvider(
                      context,
                      emailcontroller.text,
                      passwordcontroller.text,
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
                          color: Colors.grey.shade200,
                        ),
                      ),
                    ),
                    
                    Text(
                      "or",
                      style: TextStyle(fontSize: 20, color: Colors.grey,fontWeight: FontWeight.bold),
                    ),
                    
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 1,
                          //width: double.infinity,
                          color: Colors.grey.shade200,
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
                        style: TextStyle(color: Colors.blue.shade700),
                      ),
                    ),
                    
                    // Row(
                    //   //mainAxisAlignment: MainAxisAlignment.center,
                    //   //crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     Text(AppLocalizations.of(context)!.signupdiscription),
                    //     TextButton(
                    //       onPressed: () {
                    //         Navigator.of(context).push(
                    //           MaterialPageRoute(
                    //             builder: (context) => const LoginScreen(),
                    //           ),
                    //         );
                    //       },
                    //       child: Text(
                    //         AppLocalizations.of(context)!.signin,
                    //         style: TextStyle(color: Colors.blue),
                    //       ),
                    //     ),
                    //   ],
                    // ),
            
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
                            style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
