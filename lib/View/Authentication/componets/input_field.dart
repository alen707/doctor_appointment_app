import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final String hind;
  final IconData icon;
  // ignore: prefer_typing_uninitialized_variables, strict_top_level_inference
  final controller;
  const InputField({
    super.key,
    required this.hind,
    required this.icon,
    required this.controller,
  });

  @override
  State<InputField> createState() => _InputFeildState();
}

class _InputFeildState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
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
        prefixIcon: Icon(widget.icon),
        fillColor: Colors.grey.shade50,
        filled: true,
      ),
    );
  }
}
