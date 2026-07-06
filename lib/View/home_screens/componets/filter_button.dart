import 'package:flutter/material.dart';

class FilterButen extends StatelessWidget {
  final String title;
  const FilterButen({
    super.key,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ElevatedButton
                  
      (
        style: ElevatedButton.styleFrom(
          side: BorderSide(
            color: Colors.black,
            width: 1
          )
        ),
        onPressed: () {
          
        
      }
      , child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(title,style: TextStyle(
          fontSize: 14,
          color: Colors.black
        ),),
      )
      ),
    );
  }
}