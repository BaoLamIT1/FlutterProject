import 'package:coffee_shop/Model/colors.dart';
import 'package:coffee_shop/common_button.dart';
import 'package:flutter/material.dart';

import '../Model/coffee_model.dart';

class CartScreen extends StatefulWidget {
  final CoffeeData coffee;
  final Item item;
  const CartScreen({super.key, required this.coffee, required this.item});
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> with SingleTickerProviderStateMixin {
  List<String> tabs = ['Deliver', 'Pick Up'];
  bool isEditingAddress = false;
  final TextEditingController addressController =
  TextEditingController(text: "1008, Lang Street, City, HaNoi");
  late TabController _tabController;
  int quantity = 1;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {}); // Rebuild on tab change
    });
  }
  @override
  void dispose() {
    addressController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isPickUp = _tabController.index == 1;
      return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_ios_new),
                  ),
                  const SizedBox(width: 120),
                  const Text(
                    "Order",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TabBar(
                  controller: _tabController,
                  indicatorColor: xprimaryColor,
                  labelColor: Colors.white,
                  labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  unselectedLabelColor: Colors.black,
                  indicator: BoxDecoration(
                    color:  xprimaryColor,
                    borderRadius: BorderRadius.circular(10),

                  ),
                  tabs: tabs
                      .map((tab) => Tab(
                    child: SizedBox(width: double.infinity, child: Center(child: Text(tab),),),
                  ))
                      .toList(),
                ),
              ),
              const SizedBox(height: 25),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Delivery Address",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black.withOpacity(0.8),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "LamBaoBao",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black.withOpacity(0.8),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5),
                  isEditingAddress
                      ? TextField(
                    controller: addressController,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black.withOpacity(0.8),
                    ),
                    onSubmitted: (_) {
                      setState(() {
                        isEditingAddress = false;
                      });
                    },
                    autofocus: true,
                  )
                      : Text(
                    addressController.text,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black.withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      ElevatedButton.icon(
                        icon: const Icon(Icons.edit_location_alt),
                        label: const Text('Edit Address'),
                        onPressed: () {
                          setState(() {
                            isEditingAddress = true;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.grey[800],
                        ),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton.icon(
                        icon: const Icon(Icons.note_add),
                        label: const Text('Add Notes'),
                        onPressed: () {
                          // Implement add notes logic here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.grey[800],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  const Divider(
                    indent: 15,
                    endIndent: 15,
                    color: Colors.black12,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
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
                            height: 50,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.item.title,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Ice/Hot",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 2,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.remove, size: 16),
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                setState(() {
                                  if (quantity > 1) quantity--;
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            '$quantity',
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 2,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.add, size: 16),
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                setState(() {
                                  quantity++;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(
                    indent: 15,
                    endIndent: 15,
                    thickness: 4,
                    color: Color(0xFFF9F2ED),
                  ),
                  const SizedBox(height: 5),
                  // Place this just before: Text("Payment Summary", ...)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF9F2ED),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.local_offer, color: Colors.brown, size: 24),
                        const SizedBox(width: 10),
                        const Expanded(
                          child: Text(
                            "Choose discount",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text("Payment Summary",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Price ",
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "\$${(widget.item.price * quantity).toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  if (!isPickUp)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Delivery Fee",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                      Text(
                        "\$2.00",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

            ],
          ),
        ),

        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Icon(Icons.account_balance_wallet, color: Colors.brown, size: 32),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Cash/Wallet",
                        style: TextStyle(
                          color: xsecondaryColor,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "\$${(widget.item.price * quantity + (isPickUp ? 0 : 2)).toStringAsFixed(2)}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: xprimaryColor,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.keyboard_arrow_down, size: 28),
                    onPressed: () {
                      // TODO: Show payment method selection
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: CommonButton(
                  title: "Order Now",
                  onTab: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CartScreen(coffee: widget.coffee, item: widget.item),
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
