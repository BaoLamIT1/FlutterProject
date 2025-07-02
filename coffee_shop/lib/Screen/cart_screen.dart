// Updated cart_screen.dart
import 'package:coffee_shop/Model/colors.dart';
import 'package:coffee_shop/common_button.dart';
import 'package:flutter/material.dart';
import '../Model/cart_manager.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> with SingleTickerProviderStateMixin {
  List<String> tabs = ['Deliver', 'Pick Up'];
  bool isEditingAddress = false;
  final TextEditingController addressController =
  TextEditingController(text: "1008, Lang Street, City, HaNoi");
  late TabController _tabController;
  final CartManager _cartManager = CartManager();

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

    // If cart is empty, show empty state
    if (_cartManager.isEmpty) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          ),
          title: const Text(
            "Cart",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.shopping_cart_outlined,
                size: 100,
                color: Colors.grey,
              ),
              SizedBox(height: 20),
              Text(
                "Your cart is empty",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Add some coffee to get started!",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
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
                const SizedBox(height: 10),
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
                      color: xprimaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    tabs: tabs
                        .map((tab) => Tab(
                      child: SizedBox(
                        width: double.infinity,
                        child: Center(child: Text(tab)),
                      ),
                    ))
                        .toList(),
                  ),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),

          // Scrollable content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Delivery Address Section
                  if (!isPickUp) ...[
                    Text(
                      "Delivery Address",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black.withOpacity(0.8),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 5),
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
                    const Divider(
                      indent: 15,
                      endIndent: 15,
                      color: Colors.black12,
                    ),
                    const SizedBox(height: 10),
                  ],

                  // Cart Items List
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _cartManager.cartItems.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 15),
                    itemBuilder: (context, index) {
                      final cartItem = _cartManager.cartItems[index];
                      return _buildCartItemCard(cartItem);
                    },
                  ),

                  const SizedBox(height: 20),

                  // Discount Section
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

                  // Payment Summary
                  const Text(
                    "Payment Summary",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Subtotal
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Subtotal",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "\$${_cartManager.subtotal.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Delivery Fee
                  if (!isPickUp)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Delivery Fee",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black.withOpacity(0.6),
                          ),
                        ),
                        Text(
                          "\$${_cartManager.getDeliveryFee(isPickUp).toStringAsFixed(2)}",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),

                  const SizedBox(height: 100), // Space for bottom navigation
                ],
              ),
            ),
          ),
        ],
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
                      "\$${_cartManager.getTotal(isPickUp).toStringAsFixed(2)}",
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
                  // Handle order placement
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Order Placed!"),
                        content: Text(
                          "Your order of ${_cartManager.totalItemCount} item(s) "
                              "totaling \$${_cartManager.getTotal(isPickUp).toStringAsFixed(2)} "
                              "has been placed successfully!",
                        ),
                        actions: [
                          TextButton(
                            child: const Text("OK"),
                            onPressed: () {
                              _cartManager.clearCart();
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartItemCard(CartItem cartItem) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                cartItem.item.picUrl.isNotEmpty
                    ? cartItem.item.picUrl[0]
                    : cartItem.coffee.items[0].picUrl[0],
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(width: 12),

          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartItem.item.title,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Ice/Hot • Size ${cartItem.size}",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "\$${cartItem.totalPrice.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 16,
                    color: xprimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Quantity Controls
          Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Size selector
                  PopupMenuButton<String>(
                    initialValue: cartItem.size,
                    onSelected: (String newSize) {
                      setState(() {
                        final oldKey = cartItem.key;
                        cartItem.size = newSize;
                        // Note: In a real app, you might want to handle this differently
                        // as it changes the key and might duplicate items
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[300]!),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            cartItem.size,
                            style: const TextStyle(fontSize: 12),
                          ),
                          const Icon(Icons.arrow_drop_down, size: 16),
                        ],
                      ),
                    ),
                    itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                      const PopupMenuItem<String>(
                        value: 'S',
                        child: Text('Small (S)'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'M',
                        child: Text('Medium (M) +\$1.00'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'L',
                        child: Text('Large (L) +\$1.50'),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 2,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.remove, size: 14),
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        setState(() {
                          _cartManager.updateQuantity(
                            cartItem.key,
                            cartItem.quantity - 1,
                          );
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${cartItem.quantity}',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 2,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.add, size: 14),
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        setState(() {
                          _cartManager.updateQuantity(
                            cartItem.key,
                            cartItem.quantity + 1,
                          );
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}