import 'package:flutter/material.dart';
import 'package:heath_care/screens/rider/authscreenR.dart';
import 'package:heath_care/screens/rider/rider_profile.dart';
import 'package:heath_care/screens/rider/riderhomepage.dart';


class RiderScreen extends StatefulWidget {
  const RiderScreen({super.key});

  @override
  State<RiderScreen> createState() => _RiderScreenState();
}

class _RiderScreenState extends State<RiderScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    RiderHomePage(),
    RiderProfile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: const Color(0xFF13548A),
      //   elevation: 0,

      // ),
      appBar: AppBar(
        backgroundColor: const Color(0xFF018C97),
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/myicon.png'),
            radius: 20,
          ),
        ),
        title: const Text(
          'Hello Rider',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const AuthScreenR()),
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              // title: Text('Home'),
              label: 'Home',
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              // title: Text('Search'),
              label: 'Profile',
              backgroundColor: Colors.yellow),
        ],
        type: BottomNavigationBarType.fixed,
        // fixedColor: Colors.red,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        iconSize: 40,
        onTap: _onItemTapped,
        elevation: 15,
        backgroundColor: const Color(0xFF018C97),
      ),
    );
  }
}
