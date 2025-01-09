import 'package:flutter/material.dart';
import 'package:heath_care/screens/admin/adminscreen.dart';
import 'package:heath_care/screens/doctor/doctorscreen.dart';
import 'package:heath_care/screens/homepage.dart';
import 'package:heath_care/screens/patient/patientscreen.dart';
import 'package:heath_care/screens/splashscreen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PatientScreen(),

    );
  }
}