import 'package:docter_appointment_app/View/Authentication/sign_in_screen.dart';
import 'package:docter_appointment_app/View/SkipPages/skip_screen.dart';

import 'package:docter_appointment_app/l10n/app_localizations.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class SkipPageview extends StatefulWidget {
  final int pageindex;
  const SkipPageview({super.key, this.pageindex = 0});

  @override
  State<SkipPageview> createState() => _SkipPageviewState();
}

class _SkipPageviewState extends State<SkipPageview> {
  late final PageController pageController;
  int next=0;
  int count=0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: widget.pageindex,);
    
   
  }
  void load(){
 pageController = PageController(keepPage: true);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
        
          child: Container(
            color: Colors.blue,
            child: 
            PageView(
            onPageChanged: (value) {
              setState(() {
                count=value;
              });
            },
            controller: pageController,

            children: [
              SkipScreen(
                image: "assets/images/skip_screen_image_a.png",
                description: AppLocalizations.of(context)!.screenAdiscription,
                title: AppLocalizations.of(context)!.screenAtitle,
                nextpage: 1,
              ),
              SkipScreen(
                image: "assets/images/skip_screen_image_b.png",
                description: AppLocalizations.of(context)!.screenBdiscription,
                title: AppLocalizations.of(context)!.screenBtitle,
                nextpage: 2,
              ),
              SkipScreen(
                image: "assets/images/skip_screen_image_c.png",
                description: AppLocalizations.of(context)!.screenCdiscription,
                title: AppLocalizations.of(context)!.screenCtitle,
              ),
            ],
          ),
          ),
        ),

        Container(
          color: Colors.white,
        
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                
        
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 25,
                    right: 25
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                        
                    if(count==2){
                       Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen()));
                      
                    }
                    else{
                      pageController.nextPage(duration:Duration(milliseconds: 300) , curve:  Curves.easeInOut);
                    }
                  
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.next,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ),
               SizedBox(height: 10),
        
                 DotsIndicator(
                dotsCount: 3,
                position: count.toDouble(),
                decorator: DotsDecorator(
                  size: const Size.square(9.0),
                  activeSize: const Size(30.0, 9.0),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  activeColor: Colors.black,
                ),
              ),
        
        
                                  SizedBox(height: 10),
        
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen(),));
                    },
                     child: Text(
                      AppLocalizations.of(context)!.skip,
                          style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          decoration: TextDecoration.none,
                        ),
        
        
                     )
                     
                     )
        
        
        
        
        
            ],
          ),
        
        
        
        )




      ],
    );
    // SizedBox(
    //   width: double.infinity,
    //   height: double.infinity,
    //   child: Stack(
    //     children: [
    //       PageView(
    //         onPageChanged: (value) {
    //           setState(() {
    //             count=value;
    //           });
    //         },
    //         controller: pageController,

    //         children: [
    //           SkipScreen(
    //             image: "assets/images/skip_screen_image_a.png",
    //             description: AppLocalizations.of(context)!.screenAdiscription,
    //             title: AppLocalizations.of(context)!.screenAtitle,
    //             nextpage: 1,
    //           ),
    //           SkipScreen(
    //             image: "assets/images/skip_screen_image_b.png",
    //             description: AppLocalizations.of(context)!.screenBdiscription,
    //             title: AppLocalizations.of(context)!.screenBtitle,
    //             nextpage: 2,
    //           ),
    //           SkipScreen(
    //             image: "assets/images/skip_screen_image_c.png",
    //             description: AppLocalizations.of(context)!.screenCdiscription,
    //             title: AppLocalizations.of(context)!.screenCtitle,
    //           ),
    //         ],
    //       ),

    //       Positioned(
    //         bottom: 20,
    //         left: 20,
    //         right: 20,
    //         child: Column(
    //           children: [
    //             SizedBox(
    //               width: 400,

    //               child: ElevatedButton(
    //                 onPressed: () {
      
    //                 if(count==2){
    //                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen()));
                      
    //                 }
    //                 else{
    //                   pageController.nextPage(duration:Duration(milliseconds: 300) , curve:  Curves.easeInOut);
    //                 }

    //                 },
    //                 style: ElevatedButton.styleFrom(
    //                   backgroundColor: Colors.black,
    //                 ),
    //                 child: Text(
    //                   AppLocalizations.of(context)!.next,
    //                   style: TextStyle(fontSize: 16, color: Colors.white),
    //                 ),
    //               ),
    //             ),
    //              SizedBox(height: 10),

    //             DotsIndicator(
    //               dotsCount: 3,
    //               position: count.toDouble(),
    //               decorator: DotsDecorator(
    //                 size: const Size.square(9.0),
    //                 activeSize: const Size(30.0, 9.0),
    //                 activeShape: RoundedRectangleBorder(
    //                   borderRadius: BorderRadius.circular(10.0),
    //                 ),
    //                 activeColor: Colors.black,
    //               ),
    //             ),


    //                 SizedBox(height: 10),

    //                 TextButton(
    //                   onPressed: () {
    //                     Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen(),));
    //                   },
    //                    child: Text(
    //                     AppLocalizations.of(context)!.skip,
    //                         style: TextStyle(
    //                         color: Colors.grey,
    //                         fontSize: 15,
    //                         decoration: TextDecoration.none,
    //                       ),


    //                    )
                       
    //                    )
       
    //           ],
    //         ),
    //       ),


 
    //     ],
    //   ),
    // );
  }
}
