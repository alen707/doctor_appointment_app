import 'package:flutter/material.dart';

class ProfileDataButton extends StatelessWidget {
  final AssetImage icons;
  final String title;
  final VoidCallback nextpage;
  const ProfileDataButton({
    super.key,
    required this.icons,
    required this.title,
    required this.nextpage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Material(
         color: Colors.transparent,
        child: InkWell(
              //borderRadius: BorderRadius.circular(12),
         splashColor: Colors.grey.shade300,
highlightColor: Colors.grey.shade300,
        
        
         
          onTap: nextpage,
          child: Center(
            child: Ink(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(width: 2, color: Colors.grey.shade300),
                ),
              ),
                
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ImageIcon(icons, size: 24),
                        SizedBox(width: 20),
                        Text(
                          title,
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                
                    Icon(Icons.chevron_right),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
