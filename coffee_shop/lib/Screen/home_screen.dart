import 'dart:convert';
import 'package:coffee_shop/Model/coffee_model.dart';
import 'package:coffee_shop/Screen/category_coffee.dart';
import 'package:coffee_shop/Screen/coffee_detail_screen.dart';
import 'package:flutter/material.dart';

import '../Model/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late CoffeeData coffeeData;
  bool isLoading = true;
  int selectedCategoryId = 0;
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
        isLoading = false;
      });
    } catch (e) {
      print('Error loading JSON: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(0),
      children: [
        Stack(
          children: [
            Container(
              height: 280,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 17, 17, 17),
                    Color.fromARGB(255, 49, 49, 49),
                  ],
                ),
              ),
            ),
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : buildHeader(),
          ],
        ),
        const SizedBox(height: 20),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CategoryCoffee(
              onCategorySelected: (categoryId) {
                setState(() {
                  selectedCategoryId = categoryId;
                });
              },
            ),
          ),
        ),
        const SizedBox(height: 20),
        isLoading
            ? const Center(child: CircularProgressIndicator())
            :Padding(padding: EdgeInsets.symmetric(horizontal: 20),

        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.75,
            ),
          itemCount: selectedCategoryId == -1
              ? coffeeData.items.length
              : coffeeData.items
              .where((item) => item.categoryId == selectedCategoryId.toString())
              .length,
          itemBuilder: (context, index) {
            final filteredItems = selectedCategoryId == -1
                ? coffeeData.items
                : coffeeData.items
                .where((item) => item.categoryId == selectedCategoryId.toString())
                .toList();
            final item = filteredItems[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>  CoffeeDetailScreen(coffee: coffeeData, item: item,),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                          child: Image.network(
                            item.picUrl[0],
                            height: 160,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.black12.withOpacity(0.2),
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(25),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.star, color: Colors.yellow[700], size: 16),
                                const SizedBox(width: 4),
                                Text(
                                  item.rating.toString(),
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ],
                            ),),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      item.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${item.price.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 14,
                            color: xprimaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            color: xprimaryColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        )
      ],
    );
  }

  Padding buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 50),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Location",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: xsecondaryColor,
                ),
              ),
              Row(
                children: [
                  Text(
                    "Hanoi, Vietnam",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                    size: 30,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xff2a2a2a),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/ic_search.png",
                        color: Colors.white,
                        height: 35,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(0),
                            isDense: true,
                            border: InputBorder.none,
                            hintText: "Search coffee",
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: xsecondaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Container(
                height: 60,
                width: 55,
                decoration: BoxDecoration(
                  color: xprimaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.tune,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              coffeeData.banner[0].url,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}