import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addItem(CartItem item) {
    _cartItems.add(item);
    notifyListeners();
  }

  void removeItem(CartItem item) {
    _cartItems.remove(item);
    notifyListeners();
  }

  double getTotalPrice() {
    return _cartItems.fold(0.0, (sum, item) {
      return sum + double.parse(item.price.replaceAll(RegExp(r'[^\d.]'), ''));
    });
  }
}

class CartItem {
  final String name;
  final String price; 
  final String imageUrl;

  CartItem(this.name, this.price, this.imageUrl);
}

