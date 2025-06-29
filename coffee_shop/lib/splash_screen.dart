import 'package:coffee_shop/Screen/main_screen.dart';
import 'package:common_button/common_button.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            SizedBox(
              child:Image.asset(
                "assets/bg.png",
                height: size.height/1.2,
              ),
            ),
            Positioned(
                bottom: 50, right: 0, left: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Fall in Love with Coffee in Blissful Delight!",
                      textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 35, color: Colors.white, fontWeight: FontWeight.bold, height: 1.2),
                      ),
                      const SizedBox(height: 20,),
                      Text("Welcome to our cozy coffee corner where every cup is a delightful for you."
                          , textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18,  color: Colors.grey[600], height: 1.2, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        child: CommonButton(
                          text: "Get Started",
                          onPress: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_) => const MainScreen()));
                          },
                        ),
                      )

                    ],
                  ),
                ),
            ),
          ],
        ),
      ),

    );

  }
}
