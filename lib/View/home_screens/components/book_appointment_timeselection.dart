import 'package:flutter/material.dart';

class BookAppointmentTimeselection extends StatelessWidget {
  final String time;
  final int intex;
  final int selectedindex;
  final VoidCallback ontap;
  const BookAppointmentTimeselection({
    super.key,
    required this.time,
    required this.intex,
    required this.ontap,
    required this.selectedindex,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: selectedindex == intex
            ? Colors.black
            : Colors.grey.shade300,
        //foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: ontap,
      child: Text(
        time,
        style: TextStyle(
          color: selectedindex == intex ? Colors.white : Colors.black,
          fontSize: 14,
        ),
      ),
    );
  }
}
