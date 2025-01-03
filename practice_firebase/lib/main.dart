import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:practice_firebase/CRUD_Search/cruds_firebase.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Khởi tạo Firebase
  runApp(
      const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CRUDSearch(),
    );
  }
}



