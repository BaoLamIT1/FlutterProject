import 'package:coffee_shop/Screen/cart_screen.dart';
import 'package:coffee_shop/Screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
final menu = [
  {
    'icon': Iconsax.home_1,
    'destination': const HomeScreen(),
  },
  {
    'icon': Iconsax.shopping_cart ,
    'destination': const CartScreen(),
  },
  {
    'icon': Iconsax.shopping_bag,
    'destination': const Center(child: Text('Shopping')),
  },
  {
    'icon':Iconsax.notification,
    'destination': const Center(child: Text('Notification')),
  },
];