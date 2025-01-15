import 'package:doctor_appointment/View/home_screen.dart';
import 'package:doctor_appointment/View/schedule_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() =>_MainPageState();
}

class _MainPageState extends State<MainPage>{
  int selectedIndex = 0;
  final List pages = [
    const HomeScreen(),
    const Scaffold(),
    const ScheduleScreen(),
    const Scaffold(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.black26,
          selectedItemColor: Colors.purple,
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          onTap: (value){
            setState(() {
              selectedIndex = value;
            });
          },

          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.message), label: "Message"),
            BottomNavigationBarItem(icon: Icon(Icons.calendar_today_outlined), label: "Schedule"),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
      ]
      ),
      body: pages[selectedIndex],
    );
  }

}
