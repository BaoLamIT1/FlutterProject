import 'package:coffee_shop/Model/colors.dart';
import 'package:coffee_shop/Screen/cart_screen.dart';
import 'package:coffee_shop/common_button.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:readmore/readmore.dart';

import '../Model/coffee_model.dart';

class CoffeeDetailScreen extends StatefulWidget {
  final CoffeeData coffee;
  final Item item;
  const CoffeeDetailScreen({super.key,required this.coffee, required this.item});

  @override
  State<CoffeeDetailScreen> createState() => _CoffeeDetailScreenState();
}

class _CoffeeDetailScreenState extends State<CoffeeDetailScreen> {
  String selectedIndex = 'M';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: xbackgroundColor,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20,),
        children: [
          const SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios_new),
              ),
              const Text(
                "Detail",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Icon(Iconsax.heart),
            ],
          ),
          const SizedBox(height: 20,),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(20),
              child: Image.network(
                widget.item.picUrl.isNotEmpty
                    ? widget.item.picUrl[0]
                    : widget.coffee.items[0].picUrl[0],
                height: 250,
                width: double.infinity,
              ),
            ),
          ),
          const SizedBox(height: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.item.title,
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Ice/Hot",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Image.asset(
                            "assets/ic_star_filled.png",
                            width: 30,
                            height: 30,
                          ),
                          const SizedBox(width: 5),
                          Text(widget.item.rating.toString(),
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      "assets/bike.png",
                      "assets/bean.png",
                      "assets/milk.png",
                    ].map((e) {
                      return Container(
                        margin: const EdgeInsets.only(left: 12),
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.black12.withOpacity(0.02),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        alignment: Alignment.center,
                        child: Image.asset(
                          e,
                          height: 25,
                          width: 25,
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Divider(
                indent: 15,
                endIndent: 15,
                color: Colors.black12,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Description",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 5),
              ReadMoreText(
                widget.item.description,
                trimLength: 125,
                trimMode: TrimMode.Length,
                trimCollapsedText: " Read More",
                trimExpandedText: " Read Less",
                style: TextStyle(
                  fontSize: 17,
                  color: xsecondaryColor,
                ),
                moreStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: xprimaryColor,
                ),
                lessStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: xprimaryColor,
                ),
              ),
              const SizedBox(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Size",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 15),
                  //Choose Size
                  Row(
                    children: ['S', '', 'M', '', 'L'].map((e) {
                      if (e == "") return const SizedBox(width: 20);
                      bool isSelected = selectedIndex == e;
                      return Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = e;
                            });
                          },
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? xprimaryColor.withOpacity(0.1)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: isSelected ? xprimaryColor : Colors.black12,
                                width: 1,
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              e,
                              style: TextStyle(
                                fontSize: 14,
                                color: isSelected ? xprimaryColor : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 25,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Price",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: xsecondaryColor,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "\$${widget.item.price.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: xprimaryColor,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 240,
              child: CommonButton(
                title: "Buy Now",
                onTab: () {
                  Navigator.push(context,
                    MaterialPageRoute(
                      builder: (_) =>  CartScreen(coffee: widget.coffee, item: widget.item),
                    ),
                  );
                },
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
