import 'package:flutter/material.dart';

class OtherLogin extends StatelessWidget {
  final String logo;
  final String platform;
  const OtherLogin({super.key, required this.logo, required this.platform});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(10),
            side: BorderSide(color: Colors.grey.shade100, width: 4),
          ),
          backgroundColor: Colors.white,
        ),
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(logo, height: 30, width: 30),
              Text(
                platform,
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
