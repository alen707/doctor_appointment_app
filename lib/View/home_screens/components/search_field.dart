import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  final String title;
  final ValueChanged<String> onChanged;
  const SearchField({super.key, required this.title, required this.onChanged});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      height: 40,
      child: TextField(
        onChanged: widget.onChanged,

        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade100),
          ),
          fillColor: Colors.grey.shade200,

          filled: true,
          hint: Text(
            widget.title,
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          prefixIcon: ImageIcon(
            AssetImage("assets/icon/search-normal.png"),
            size: 30,
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            //borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
