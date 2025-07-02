import 'package:coffee_shop/Model/coffee_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../Model/cart_manager.dart';

class CartProvider extends ChangeNotifier {
  final CartManager _cartManager = CartManager();

  List<CartItem> get cartItems => _cartManager.cartItems;

  CartProvider() {
    _loadCart();
  }

  void addItem(Item item, CoffeeData coffee, {String size = 'S'}) {
    _cartManager.addItem(item, coffee, size: size);
    _saveCart();
    notifyListeners();
  }

  void removeItem(String key) {
    _cartManager.removeItem(key);
    _saveCart();
    notifyListeners();
  }

  void clearCart() {
    _cartManager.clearCart();
    _saveCart();
    notifyListeners();
  }

  // --- Persistence ---
  Future<void> _saveCart() async {
    final prefs = await SharedPreferences.getInstance();
    final cartJson = jsonEncode(_cartManager.cartItems.map((e) => {
      'item': {
        'title': e.item.title,
        'price': e.item.price,
      },
      'coffee': {
        // Add coffee fields as needed
      },
      'quantity': e.quantity,
      'size': e.size,
    }).toList());
    await prefs.setString('cart', cartJson);
  }

  Future<void> _loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final cartJson = prefs.getString('cart');
    if (cartJson != null) {
      // Parse and restore cart items here
      // (You need to implement fromJson for your models)
    }
    notifyListeners();
  }
}