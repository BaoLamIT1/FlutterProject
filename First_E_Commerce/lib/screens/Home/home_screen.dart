import 'package:e_commerce/screens/Home/Widget/image_slider.dart';
import 'package:e_commerce/screens/Home/Widget/search_bar.dart';
import 'package:e_commerce/screens/Home/Widget/image_slider.dart';
import 'package:flutter/material.dart';
import 'Widget/home_app_bar.dart';
class  HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  int currentSlider = 0;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
    body: SingleChildScrollView(
      child: Padding(padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 35,),
              CustomAppBar(),
          SizedBox(height: 20,),
              MySearchBar(),
          SizedBox(height: 20,),
              ImageSlider(
                currentSlide: currentSlider,
                onchange: (value){
                  setState(
                          () {
                    currentSlider = value;
                  },
                  );
                },
              ),
          const SizedBox(height: 20,)

            ],
      ),
      ),
    ),);
  }
}


