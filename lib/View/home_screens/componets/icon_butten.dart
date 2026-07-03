import 'package:flutter/material.dart';

class IconButten extends StatelessWidget {
  final AssetImage ico;
  final String text;
  const IconButten({
    
    super.key,
    required this.ico,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              //height: double.infinity,
               //width: 50,
               height: 50,
              
              
              decoration: 
               BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                
                image: DecorationImage(image: ico,
               fit: BoxFit.cover
               )
                
               )
              ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: 55,
            height: 18,
            
            child: Text(text,
            style: TextStyle(
              fontSize: 12
            ),),
          ),
        )
      ],
    );
  }
}
