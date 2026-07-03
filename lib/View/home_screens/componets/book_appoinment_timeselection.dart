import 'package:flutter/material.dart';

class BookAppoinmentTmeselection extends StatelessWidget {
  final String time;
  const BookAppoinmentTmeselection({
    super.key,
    required this.time
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey.shade300,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: () {},
      child: Text(
        time,
        style: TextStyle(color: Colors.black, fontSize: 14),
      ),
    );
  }
}
