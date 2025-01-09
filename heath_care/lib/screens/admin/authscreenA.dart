import 'package:flutter/material.dart';
import 'package:heath_care/screens/admin/signind.dart';
import 'package:heath_care/screens/admin/signupd.dart';


class AuthScreenA extends StatefulWidget {
  const AuthScreenA({super.key});

  @override
  State<AuthScreenA> createState() => _AuthScreenStateA();
}

class _AuthScreenStateA extends State<AuthScreenA> {
  bool isSignIn = true;
  final GlobalKey<FormState> _signInFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailControllersu = TextEditingController();
  final TextEditingController _passwordControllersu = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: size.height * 0.38,
            decoration: const BoxDecoration(
              color: Color(0xFF13548A),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35),
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: size.height * 0.09),
                Image.asset(
                  'assets/images/admin.png',
                  scale: 20,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            isSignIn = true;
                          });
                        },
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      // TextButton(
                      //   onPressed: () {
                      //     setState(() {
                      //       isSignIn = false;
                      //     });
                      //   },
                      //   child: const Text(
                      //     'Sign Up',
                      //     style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 20,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              // top: size.height * 0.38 + 20,
              // left: 20,
              // right: 20,
              child: isSignIn
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 30),
                      child: SigninFormA(
                          signInFormKey: _signInFormKey,
                          idController: _emailController,
                          passwordController: _passwordController),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 30),
                      child: SignupFormA(
                        signUpFormKey: _signUpFormKey,
                        nameController: _nameController,
                        phoneNumberController: _phoneNumberController,
                        emailController: _emailControllersu,
                        passwordController: _passwordControllersu,
                        ageController: _ageController,
                        addressController: _addressController,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
