
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:practice_firebase/Login%20Sigup/ChatApp/chat_page.dart';
import 'package:practice_firebase/Login%20Sigup/Screen/home_screen.dart';
import 'Login Sigup/Screen/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Khởi tạo Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final user = FirebaseAuth.instance.currentUser;
            final email = user?.email ?? 'Unknown User'; // Lấy email hoặc để mặc định
            return ChatPage(email: email);
          } else {
            return const LoginScreen();
          }
        },
      ),
    );
  }
}




