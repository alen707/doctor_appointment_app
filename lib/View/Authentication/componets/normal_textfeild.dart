import 'package:flutter/material.dart';

class NormalTextfeild extends StatefulWidget {
  final String hind;
  const NormalTextfeild({super.key, required this.hind});

  @override
  State<NormalTextfeild> createState() => _InputFeildState();
}

class _InputFeildState extends State<NormalTextfeild> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.black, width: 2),
          ),

          hintText: widget.hind,
          hintStyle: TextStyle(color: Colors.grey),
          fillColor: Colors.grey.shade50,
          filled: true,
        ),
      ),
    );
  }
}
