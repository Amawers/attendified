import 'package:attendified/src/pages/core/dashboard_screen.dart';
import 'package:attendified/src/pages/attendance/los_screen.dart';
import 'package:attendified/src/pages/scanning/scan_qr_screen.dart';
import 'package:attendified/src/pages/core/settings_screen.dart';
import 'package:flutter/material.dart';


// Kani siya na widget present ni siya sa tanan pages 
class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}



class _BottomNavBarState extends State<BottomNavBar> {
  /* Magdetermine kung unsa na nga page, ang initial 
  is 0 which is equal to DashboardPage based sa list*/
  int currentPage = 0;

  /* List sa mga page which is an index gamiton para
  sa pag navigate kada page*/
  List<Widget> pages =  [
    DashboardScreen(),
    ListOfStudentsScreen(),
    ScanQrScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Present sa tanan pages kani na appbar
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Image.asset(
          'assets/images/logo.png',
          width: 80,
          height: 80,
        ),
        elevation: 10,
      ),
      // Body which mag determine kung unsa na nga page
      body: pages.elementAt(currentPage),

      // Kani na bottom nav bar present ni siya gyapon sa tanan pages
      bottomNavigationBar: SizedBox(
        height: 65,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Los',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.qr_code_scanner),
              label: 'Scan',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          currentIndex: currentPage,
          showUnselectedLabels: true,
          /* Logic para sa pag change sa page, basically alisdan ra ang integer value 
          sa currentpage which is kada value ga represent ug page based sa list sa taas*/
          onTap: (int value) {
            setState(() {
              currentPage = value;
            });
          },
        ),
      ),
    );
  }
}
