import 'package:flutter/material.dart';

class SearchFeild extends StatelessWidget {
  final String title;
  const SearchFeild({
    super.key,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.grey.shade100),
          ),
          fillColor: Colors.grey.shade300,
          filled: true,
          hint: Text(
            title,
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey,
            size: 14,
          ),
          border: OutlineInputBorder(
            //borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}

