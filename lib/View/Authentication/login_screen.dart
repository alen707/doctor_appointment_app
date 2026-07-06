import 'package:docter_appointment_app/View/Authentication/componets/input_button.dart';
import 'package:docter_appointment_app/View/Authentication/componets/input_feild.dart';
import 'package:docter_appointment_app/View/Authentication/componets/other_login.dart';
import 'package:docter_appointment_app/View/Authentication/edit_profile_screen.dart';
import 'package:docter_appointment_app/View/Authentication/signin_screen.dart';
import 'package:docter_appointment_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailcontroller = TextEditingController();
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
        child: Center(
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
                  AppLocalizations.of(context)!.createAcount,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            
                SizedBox(height: 10),
            
                Text(
                  AppLocalizations.of(context)!.loginDiscription,
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
            
                SizedBox(height: 15,),
            
                InputFeild(hind: AppLocalizations.of(context)!.youerName,icon:Icons.person,controller: emailcontroller,),
                InputFeild(hind: AppLocalizations.of(context)!.yourMail,icon: Icons.email,controller: emailcontroller,),
                InputFeild(hind: AppLocalizations.of(context)!.password,icon: Icons.password,controller: emailcontroller,),
            
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20
                  ),
                  child: InputButton(inputText: AppLocalizations.of(context)!.createAcount,
                  nextpage: ()=> Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context)=> const EditProfileScreen(from: "login",)
                      )
                  ),
                  ),
                ),
                SizedBox(height: 20,),
            
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
            
                    Text("or",
                    style:TextStyle(
                      fontSize: 20,
                      color: Colors.grey
                    ) ,
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
            
                SizedBox(height: 20,),
            
                OtherLogin(logo: "assets/images/google_logo.png",platform: AppLocalizations.of(context)!.google,),
                SizedBox(height: 20,),
                OtherLogin(logo: "assets/images/facebook_logo.png",platform: AppLocalizations.of(context)!.facebook,),
            
                SizedBox(height: 20,),
            
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppLocalizations.of(context)!.signinDiscription),
                    TextButton(
                      onPressed: (){
                         Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context)=> const SignUpScreen()
                      )
                  );
                      }, 
                      child:Text(AppLocalizations.of(context)!.signin,
                      style: TextStyle(
                        color: Colors.blue
                      ),
                      )
                      )
                  ],
                )
            
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}

