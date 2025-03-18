
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:practice_firebase/Patient/home_screen_patient.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>{
  int selectedIndex = 0;
  final List pages = [
    const HomeScreenPatient(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.deepPurple,
          color: Colors.deepPurple.shade200,
          animationDuration: Duration(milliseconds: 300),
          onTap: (value){
            setState(() {
              selectedIndex = value;
            });
          },
          items: const [
            Icon(Icons.home, color: Colors.white,),
            Icon(Icons.message, color: Colors.white,),
            Icon(Icons.calendar_today_outlined, color: Colors.white,),
            Icon(Icons.settings_rounded,color: Colors.white,),
          ]
      ),
      body: pages[selectedIndex],
    );
  }

}
