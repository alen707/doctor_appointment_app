import 'package:docter_appointment_app/View/home_screens/booking_screen_layout.dart';
import 'package:docter_appointment_app/View/home_screens/home_screen.dart';
import 'package:docter_appointment_app/View/home_screens/location_screen.dart';
import 'package:docter_appointment_app/View/home_screens/profile_screen.dart';
import 'package:flutter/material.dart';

class HomeLayout extends StatefulWidget {
  

  const HomeLayout({super.key,
  
  });

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const MyHomePage( ),
    
    const LocationScreen(),
    const BookingScreenLayout(),
    const ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        
        onTap: (index) => setState(() {
          _currentIndex=index;
        }),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.location_on), label: ""),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_sharp),
            label: "",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),
    );
  }
}
