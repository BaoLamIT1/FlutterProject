// cart_manager.dart
import '../Model/coffee_model.dart';

class CartItem {
  final Item item;
  final CoffeeData coffee;
  int quantity;
  String size;

  CartItem({
    required this.item,
    required this.coffee,
    this.quantity = 1,
    this.size = 'S',
  });

  double get basePrice => item.price;

  double get sizeUpcharge {
    switch (size) {
      case 'M':
        return 1.0;
      case 'L':
        return 1.5;
      default:
        return 0.0;
    }
  }

  double get totalPrice => (basePrice + sizeUpcharge) * quantity;

  // Create a unique key for the cart item based on item and size
  String get key => '${item.title}_$size';
}

class CartManager {
  static final CartManager _instance = CartManager._internal();
  factory CartManager() => _instance;
  CartManager._internal();

  final List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => List.unmodifiable(_cartItems);

  void addItem(Item item, CoffeeData coffee, {String size = 'S'}) {
    final key = '${item.title}_$size';

    // Check if item with same size already exists
    final existingIndex = _cartItems.indexWhere((cartItem) => cartItem.key == key);

    if (existingIndex != -1) {
      // Item exists, increase quantity
      _cartItems[existingIndex].quantity++;
    } else {
      // New item, add to cart
      _cartItems.add(CartItem(
        item: item,
        coffee: coffee,
        size: size,
      ));
    }
  }

  void removeItem(String key) {
    _cartItems.removeWhere((item) => item.key == key);
  }

  void updateQuantity(String key, int newQuantity) {
    if (newQuantity <= 0) {
      removeItem(key);
      return;
    }

    final index = _cartItems.indexWhere((item) => item.key == key);
    if (index != -1) {
      _cartItems[index].quantity = newQuantity;
    }
  }

  void updateSize(String oldKey, String newSize) {
    final index = _cartItems.indexWhere((item) => item.key == oldKey);
    if (index != -1) {
      _cartItems[index].size = newSize;
    }
  }

  void clearCart() {
    _cartItems.clear();
  }

  double get subtotal {
    return _cartItems.fold(0, (sum, item) => sum + item.totalPrice);
  }

  double getDeliveryFee(bool isPickup) {
    return isPickup ? 0.0 : 2.0;
  }

  double getTotal(bool isPickup) {
    return subtotal + getDeliveryFee(isPickup);
  }

  int get totalItemCount {
    return _cartItems.fold(0, (sum, item) => sum + item.quantity);
  }

  bool get isEmpty => _cartItems.isEmpty;
}