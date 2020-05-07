import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop/providers/product.dart';

class CartItem {
  final String id;
  final String title;
  final String productId;
  final int quantity;
  final double price;

  CartItem({
    @required this.productId,
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

  int get itemsCount {
    return _items.length;
  }

  double get totalAmount {
    double _total = 0.0;
    _items.forEach((key, value) {
      _total += value.price * value.quantity;
    });

    return _total;
  }

  void addItem(Product item) {
    if (_items.containsKey(item.id)) {
      _items.update(
        item.id,
        (cartItem) => CartItem(
          id: cartItem.id,
          productId: item.id,
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
          productId: item.id,
          title: item.title,
          quantity: 1,
          price: item.price,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);

    notifyListeners();
  }
}
