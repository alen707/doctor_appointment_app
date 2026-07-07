import 'package:docter_appointment_app/View/Authentication/signin_screen.dart';
import 'package:docter_appointment_app/View/SkipPages/skip_screen1.dart';
import 'package:docter_appointment_app/ViewModal/skippage_sharedpreferance.dart';
import 'package:flutter/material.dart';

class FirstLoadingScreen extends StatefulWidget {
  const FirstLoadingScreen({super.key});

  @override
  State<FirstLoadingScreen> createState() => _FirstLoadingScreenState();
}

class _FirstLoadingScreenState extends State<FirstLoadingScreen> {
  bool firstStart = false;

  @override
  void initState() {
    super.initState();
    checkStatus();
  }

  Future<void> checkStatus() async {
    bool firstStart = await SkippageSharedpreferance.getStatus();

    await Future.delayed(const Duration(seconds: 3));

    if (firstStart) {
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (_) => const SkipScreenA()),
      );
    } else {
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (_) => const SignUpScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/first_loading_screen.png"),
          fit: BoxFit.cover,
        ),
      ),
    );

    // Column(
    //   children: [
    //     Expanded(
    //       child: Row(
    //         children: [
    //           Expanded(
    //             flex: 1,
    //             child: FirstScreenContainerNoImage(color: const Color.fromARGB(255, 3, 167, 255),),
    //           ),
    //           Expanded(
    //             flex: 2,
    //             child: FirstScreenContainerWithImage(),
    //           ),
    //           Expanded(
    //             flex: 1,
    //             child: FirstScreenContainerNoImage(color: Colors.red,)
    //           )
    //         ],
    //       ),

    //     ),

    //      Expanded(
    //       child: Row(
    //         children: [
    //           Expanded(
    //             flex: 1,
    //             child: FirstScreenContainerWithImage(),
    //           ),
    //           Expanded(
    //             flex: 2,
    //             child: FirstScreenContainerNoImage(color: Colors.red,)
    //           ),
    //           Expanded(
    //             flex: 1,
    //             child: FirstScreenContainerWithImage(),
    //           )
    //         ],
    //       ),

    //     ),
    //      Expanded(
    //       child: Row(
    //         children: [
    //           Expanded(
    //             flex: 1,
    //             child: FirstScreenContainerNoImage(color: Colors.orange,),
    //           ),
    //           Expanded(
    //             flex: 2,
    //             child: FirstScreenContainerWithImage(),
    //           ),
    //           Expanded(
    //             flex: 1,
    //             child: FirstScreenContainerNoImage(color: Colors.red,)
    //           )
    //         ],
    //       ),

    //     )
    //   ],
    // );
  }
}

class FirstScreenContainerWithImage extends StatelessWidget {
  const FirstScreenContainerWithImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/skip_screen_image_a.png"),
        ),
      ),
      height: double.infinity,
    );
  }
}

class FirstScreenContainerNoImage extends StatelessWidget {
  final Color color;
  const FirstScreenContainerNoImage({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(height: double.infinity, color: color);
  }
}
