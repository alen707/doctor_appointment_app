

import 'package:docter_appointment_app/ViewModal/skippage_sharedpreferance.dart';

import 'package:flutter/material.dart';

class SkipScreen extends StatefulWidget {
  final String image;
  final String title;
  final String description;
  final int nextpage;
  const SkipScreen(
      {
      super.key,
      required this.image,
      required this.description,
      required this.title,
       this.nextpage=-1
      }
    );

  @override
  State<SkipScreen> createState() => _SkipScreenState();
}

class _SkipScreenState extends State<SkipScreen> {
  Future changeStatus() async {
    await SkippageSharedpreferance.saveStatus(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        //color: Colors.blueAccent,
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.image),
                    fit: BoxFit.cover,
                  ),
                ),
                //height: double.infinity,
              ),
            ),
            Container(
              color: Colors.white,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 1),
                    Text(
                      widget.title,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        //fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    SizedBox(height: 10),
            
                    Text(
                      widget.description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        decoration: TextDecoration.none,
                        height: 1.5,
                      ),
                    ),
                    
            
                    // SizedBox(
                    //   width: double.infinity,
                    //   child: ElevatedButton(
                    //     onPressed: () {
                    //       if (widget.nextpage==-1){
                    //       Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen(),));
                    //       }
                    //       else{
                    //       Navigator.of(context).push(
                    //         MaterialPageRoute(
                    //           builder: 
                    //           (context) => SkipPageview(pageindex: widget.nextpage,),
                    //         ),
                    //       );
                    //       }
                    //     },
                    //     style: ElevatedButton.styleFrom(
                    //       backgroundColor: Colors.black,
                    //     ),
                    //     child: Text(
                    //       AppLocalizations.of(context)!.next,
                    //       style: TextStyle(fontSize: 16, color: Colors.white),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(height: 10),
                    // DotsIndicator(
                    //   dotsCount: 3,
                    //   position: 0,
                    //   decorator: DotsDecorator(
                    //     size: const Size.square(9.0),
                    //     activeSize: const Size(30.0, 9.0),
                    //     activeShape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(10.0),
                    //     ),
                    //     activeColor: Colors.black,
                    //   ),
                    // ),
            
                    // SizedBox(height: 10),
                    // InkWell(
                    //   onTap: () {
                    //     changeStatus();
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => SignInScreen(),
                    //       ),
                    //     );
                    //   },
                    //   child: Text(
                    //     AppLocalizations.of(context)!.skip,
                    //     style: TextStyle(
                    //       color: Colors.grey,
                    //       fontSize: 15,
                    //       decoration: TextDecoration.none,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            
              //height: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
