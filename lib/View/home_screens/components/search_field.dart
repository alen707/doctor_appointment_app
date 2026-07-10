import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  final String title;
  final ValueChanged<String> onChanged;
  const SearchField({
    super.key, 
    required this.title,
    required this.onChanged,
    });

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        onChanged: widget.onChanged,
        
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.grey.shade100),
          ),
          fillColor: Colors.grey.shade300,
          filled: true,
          hint: Text(widget.title, style: TextStyle(color: Colors.grey, fontSize: 14)),
          prefixIcon: Icon(Icons.search, color: Colors.grey, size: 14),
          border: OutlineInputBorder(
            //borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
