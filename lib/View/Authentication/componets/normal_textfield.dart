import 'package:flutter/material.dart';

class NormalTextfield extends StatefulWidget {
  final String hind;
  const NormalTextfield({super.key, required this.hind});

  @override
  State<NormalTextfield> createState() => _InputFeildState();
}

class _InputFeildState extends State<NormalTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color:Color.fromARGB(106, 158, 158, 158), width: 1),
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
    );
  }
}
