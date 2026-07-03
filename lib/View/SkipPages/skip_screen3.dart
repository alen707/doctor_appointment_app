import 'package:docter_appointment_app/View/Authentication/login_screen.dart';
import 'package:docter_appointment_app/View/Authentication/signin_screen.dart';
import 'package:docter_appointment_app/l10n/app_localizations.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class SkipScreenC extends StatefulWidget {
  const SkipScreenC({super.key});

  @override
  State<SkipScreenC> createState() => _SkipScreenState();
}

class _SkipScreenState extends State<SkipScreenC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        //color: Colors.blueAccent,
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/skip_screen_image_c.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                //height: double.infinity,
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.white,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 10),
                      Text(
                        AppLocalizations.of(context)!.screenCtitle,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          //fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      SizedBox(height: 10),
      
                      Text(
                       AppLocalizations.of(context)!.screenCdiscription,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          decoration: TextDecoration.none,
                          height: 1.5,
                        ),
                      ),
                      SizedBox(height: 10),
      
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute<void>(
                                builder:(context) =>  SignUpScreen()
                                 )
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                          ),
                          child: Text(
                            AppLocalizations.of(context)!.next,
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      DotsIndicator(
                        dotsCount: 3,
                        position: 2,
                        decorator: DotsDecorator(
                          size: const Size.square(9.0),
                          activeSize: const Size(30.0, 9.0),
                          activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          activeColor:Colors.black 
                        ),
                      ),
      
                      SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
                        },
                        child: Text(
                          AppLocalizations.of(context)!.skip,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
      
                //height: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
