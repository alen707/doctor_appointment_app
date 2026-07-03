import 'package:flutter/material.dart';

class InputFeild extends StatefulWidget {

  final String hind;
  final IconData icon;
  final controller;
  const InputFeild({
    
  
    super.key,
    required this.hind,
    required this.icon,
    required this.controller

  });

  @override
  State<InputFeild> createState() => _InputFeildState();

}

class _InputFeildState extends State<InputFeild> {
  @override

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.black, width: 2),
          ),
    
          hintText: widget.hind,hintStyle: TextStyle(
            color: Colors.grey
          ),
          prefixIcon: Icon(widget.icon),
          fillColor: Colors.grey.shade50,
          filled: true
        ),
      ),
    );
  }
}
