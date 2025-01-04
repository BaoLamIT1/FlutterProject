
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:practice_firebase/Login%20Sigup/Screen/home_screen.dart';

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
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),

      // Làm cho app không bị log out ra ngoài khi khởi động laị máy, mà tiếp tục đăng nhập
      // StreamBuilder(
      //     stream: FirebaseAuth.instance.authStateChanges(),
      //     builder: (context,snapshot){
      //       if (snapshot.hasData){
      //         return const HomeScreen();
      //       }
      //       else{
      //         return  const LoginScreen();
      //       }
      //     },)
    );
  }
}



