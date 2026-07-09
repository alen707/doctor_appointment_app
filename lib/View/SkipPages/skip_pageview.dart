import 'package:docter_appointment_app/View/SkipPages/skip_screen1.dart';
import 'package:docter_appointment_app/View/SkipPages/skip_screen2.dart';
import 'package:docter_appointment_app/View/SkipPages/skip_screen3.dart';
import 'package:flutter/material.dart';

class SkipPageview extends StatefulWidget {
  final int pageindex;
  const SkipPageview({
    super.key,
    this.pageindex=0
    });

  @override
  State<SkipPageview> createState() => _SkipPageviewState();
}

class _SkipPageviewState extends State<SkipPageview> {
  late final PageController pageController;
  // List skiplist=[
  //   SkipScreenA(),
  //   SkipScreenB(),
  //   SkipScreenC()
  // ];

    @override
      void initState() {
    super.initState();
    pageController = PageController(
      initialPage: widget.pageindex,
    );
  }
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController ,
      children: [
            SkipScreenA(),
    SkipScreenB(),
    SkipScreenC()
      ],

    );
  }
}