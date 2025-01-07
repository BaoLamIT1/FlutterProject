
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice_firebase/Login%20Sigup/ChatApp/chat_page.dart';
import 'package:practice_firebase/Login%20Sigup/Screen/sign_up.dart';
import 'package:practice_firebase/Login%20Sigup/Service/authentication.dart';
import 'package:practice_firebase/Login%20Sigup/Service/forgot_pasword.dart';
import 'package:practice_firebase/Login%20Sigup/Widget/button.dart';
import 'package:practice_firebase/Login%20Sigup/Widget/snackbar.dart';
import 'package:practice_firebase/Login%20Sigup/Widget/text_field.dart';

import '../Service/google_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false ;
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void logInUsers() async {
    // set is loading to true.
    setState(() {
      isLoading = true;
    });
    // signup user using our authmethod
    String res = await AuthMethod().loginUser(
        email: emailController.text,
        password: passwordController.text,

       );
    // if string return is success, user has been creaded and navigate to next screen other witse show error.
    if (res == "success") {
      setState(() {
        isLoading = false;
      });
      //navigate to the next screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => ChatPage(email: emailController.text,),
        ),
      );
    } else {
      setState(() {
        isLoading = false;
      });
      // show error
      showSnackBar(context, res);
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              height: height / 2.7,
              child: Image.asset('images/signup1.jpeg'),
            ),
            TextFieldInpute(
            icon: Icons.person,
            textEditingController: emailController,
            hintText: 'Enter your email',
            textInputType: TextInputType.text),
            TextFieldInpute(
              icon: Icons.lock,
              textEditingController: passwordController,
              hintText: 'Enter your password',
              textInputType: TextInputType.text,
              isPass: true,
            ),
            const ForgotPassword(),
            MyButtons(onTap: logInUsers,
                text: "Log In"),
            SizedBox(height: height / 50,),

            // MyButtons(onTap: loginUser, text: "Log In"),
            Row(
              children: [
                Expanded(
                  child: Container(height: 1, color: Colors.black26),
                ),
                const Text("  or  "),
                Expanded(
                  child: Container(height: 1, color: Colors.black26),
                )
              ],
            ),
            // for google login
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: ElevatedButton(
                style:
                ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
                onPressed: () async {
                  await FirebaseServices().signInWithGoogle();

                  final user = FirebaseAuth.instance.currentUser;
                  if (user != null && user.email != null) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatPage(email: user.email!),
                      ),
                    );
                  } else {
                    showSnackBar(context, "Google Sign-In failed. Please try again.");
                  }
                },

                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Image.network(
                        "https://ouch-cdn2.icons8.com/VGHyfDgzIiyEwg3RIll1nYupfj653vnEPRLr0AeoJ8g/rs:fit:456:456/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9wbmcvODg2/LzRjNzU2YThjLTQx/MjgtNGZlZS04MDNl/LTAwMTM0YzEwOTMy/Ny5wbmc.png",
                        height: 35,
                      ),
                    ),
                    const SizedBox(width: 30),
                    const Text(
                      "Continue with Google",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account? ", style: TextStyle(fontSize: 16),),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context)=> const SignUpScreen(),
                    ),
                    );
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.red,
                    ),
                  ),
                )
              ],
            ),
          ]
        ),
      )
      ),
    );
  }

}


