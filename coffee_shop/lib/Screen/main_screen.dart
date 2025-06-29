import 'package:coffee_shop/Model/colors.dart';
import 'package:coffee_shop/Model/icon_bottom_nav_model.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: xbackgroundColor,
      body: menu[index]['destination'] as Widget,
      bottomNavigationBar:Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
      child: Row(
        children: [
          ...List.generate(menu.length, (index) {
            Map menuItem = menu[index];
            bool isSelected = this.index == index;
            return Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    this.index = index;
                  });
                },
                child: SizedBox(
                  height: 60,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(menuItem['icon'], color: isSelected ? xprimaryColor : Colors.grey, size: 30,),
                      if (isSelected) const SizedBox(height: 5,),
                      if (isSelected)
                        Container(
                          height: 3,
                          width: 30,
                          decoration: BoxDecoration(
                            color: xprimaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        )
                    ],
                  ),
                ),
              ),
            );
          })
        ],
      )
      ),
    );
  }
}
