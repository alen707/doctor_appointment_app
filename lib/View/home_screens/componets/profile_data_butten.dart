import 'package:flutter/material.dart';

class ProfileDataButten extends StatelessWidget {
  final AssetImage icons;
  final String title;
  final VoidCallback nextpage;
  const ProfileDataButten({
    super.key,
    required this.icons,
    required this.title,
    required this.nextpage
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 15,
        
      ),
      child: InkWell(
        onTap: nextpage,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 2,
                color: Colors.grey.shade300
              )
            )
          ),
          
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 10
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                ImageIcon(icons,size: 24,),
                SizedBox(width: 20,),
                Text(title,style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 18
                ),),]),
                
                Icon(Icons.chevron_right)
              ],
            ),
          ),
        ),
      ),
    );
  }
}