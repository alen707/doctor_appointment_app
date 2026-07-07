import 'package:flutter/material.dart';

class DoctorDetailsBadge extends StatelessWidget {
  final AssetImage icon;
  final String data;
  final String title;
  const DoctorDetailsBadge({
    super.key,
    required this.data,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 59,
          height: 59,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            shape: BoxShape.circle,
          ),
          child: ImageIcon(icon),
        ),
        Row(
          children: [
            Text(
              data,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            //  Text("+",style: TextStyle(
            //   color: Colors.black,
            //   fontSize: 14,
            //   fontWeight: FontWeight.bold
            // ),),
          ],
        ),
        Text(title, style: TextStyle(color: Colors.grey, fontSize: 14)),
      ],
    );
  }
}
