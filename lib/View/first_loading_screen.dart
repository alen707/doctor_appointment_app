import 'package:flutter/material.dart';

class FirstLoadingScreen extends StatelessWidget {
  const FirstLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/first_loading_screen.png"),
          fit: BoxFit.cover
          )
      ),
    );
  }
}