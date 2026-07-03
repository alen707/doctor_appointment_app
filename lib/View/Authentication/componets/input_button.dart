import 'package:flutter/material.dart';

class InputButton extends StatelessWidget {
  final String inputText;
  final VoidCallback nextpage;
  const InputButton({
    super.key,
    required this.inputText,
    required this.nextpage
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black
        ),
        onPressed:nextpage,
         child: Padding(
           padding: const EdgeInsets.all(10.0),
           child: Text(inputText,
           style: TextStyle(
            color: Colors.white,
            fontSize: 20
           ),
           ),
         )
         ),
    );
  }
}

