import 'package:docter_appointment_app/View/home_screens/booking_screen_layout.dart';
import 'package:docter_appointment_app/View/home_screens/home_screen.dart';
import 'package:docter_appointment_app/View/home_screens/location_screen.dart';
import 'package:docter_appointment_app/View/home_screens/profile_screen.dart';
import 'package:flutter/material.dart';

class HomeLayout extends StatefulWidget {
  final int initialIndex;

  const HomeLayout({super.key, this.initialIndex = 0});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const MyHomePage(),
    const LocationScreen(),
    const BookingScreenLayout(),
    const ProfileScreen(),
  ];
  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),

      bottomNavigationBar: SizedBox(
        height: 95,
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,


          backgroundColor: Colors.white,
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,

          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.black,

          onTap: (index) => setState(() {
            _currentIndex = index;
          }),
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/icon/activeHome.png")),
              label: "",
              activeIcon: ImageIcon(AssetImage("assets/icon/home.png")),
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/icon/location.png")),
              label: "",
              activeIcon: ImageIcon(
                AssetImage("assets/icon/activelocation.png"),
              ),
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/icon/calendar.png")),
              label: "",
              activeIcon: ImageIcon(
                AssetImage("assets/icon/activecalendar.png"),
              ),
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/icon/Profile.png")),
              label: "",
              activeIcon: ImageIcon(AssetImage("assets/icon/activeframe.png")),
            ),
          ],
        ),
      ),
    );
  }
}
