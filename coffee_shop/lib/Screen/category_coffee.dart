import 'dart:convert';
import 'package:coffee_shop/Model/coffee_model.dart';
import 'package:flutter/material.dart';

import '../Model/colors.dart';

class CategoryCoffee extends StatefulWidget {
  final Function(int) onCategorySelected;

  const CategoryCoffee({Key? key, required this.onCategorySelected})
      : super(key: key);

  @override
  _CategoryCoffeeState createState() => _CategoryCoffeeState();
}

class _CategoryCoffeeState extends State<CategoryCoffee> {
  late CoffeeData coffeeData;
  int selectedIndex = 0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    try {
      final String jsonString =
      await DefaultAssetBundle.of(context).loadString('assets/coffee_data.json');
      final jsonData = jsonDecode(jsonString);
      setState(() {
        coffeeData = CoffeeData.fromJson(jsonData);
        // Add "All" category at the beginning
        coffeeData.categories.insert(0, Category(id: -1, title: 'All'));
        isLoading = false;
      });
      // Initialize with "All" category
      widget.onCategorySelected(-1);
    } catch (e) {
      print('Error loading JSON: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  Widget categorySelection() {
    if (isLoading) {
      return const SizedBox(
        height: 30,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    return SizedBox(
      height: 30,
      child: ListView.builder(
        itemCount: coffeeData.categories.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              widget.onCategorySelected(coffeeData.categories[index].id);
            },
            child: Container(
              margin: EdgeInsets.only(
                left: index == 0 ? 25 : 10,
                right: index == coffeeData.categories.length - 1 ? 25 : 10,
              ),
              decoration: BoxDecoration(
                color: selectedIndex == index
                    ? xprimaryColor
                    : xsecondaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(6),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.center,
              child: Text(
                coffeeData.categories[index].title,
                style: TextStyle(
                  fontWeight: selectedIndex == index
                      ? FontWeight.bold
                      : FontWeight.normal,
                  fontSize: 16,
                  color: selectedIndex == index ? Colors.white : Colors.black,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return categorySelection();
  }
}