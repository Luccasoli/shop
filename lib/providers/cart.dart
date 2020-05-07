import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop/providers/product.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void addItem(Product item) {
    if (_items.containsKey(item.id)) {
      _items.update(
        item.id,
        (cartItem) => CartItem(
          id: cartItem.id,
          price: cartItem.price,
          title: cartItem.title,
          quantity: cartItem.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        item.id,
        () => CartItem(
          id: Random().nextDouble().toString(),
          title: item.title,
          quantity: 1,
          price: item.price,
        ),
      );
    }
    notifyListeners();
  }
}
