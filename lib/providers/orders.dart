import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:shop/providers/cart.dart';

class OrderItem {
  final String id;
  final double total;
  final List<CartItem> products;
  final DateTime date;

  OrderItem({
    this.id,
    this.total,
    this.products,
    this.date,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _items = [];

  List<OrderItem> get items => [..._items];

  int get itemsCount {
    return _items.length;
  }

  void addOrder(Cart cart) {
    _items.insert(
        0,
        OrderItem(
          id: Random().nextDouble().toString(),
          total: cart.totalAmount,
          products: cart.items.values.toList(),
          date: DateTime.now(),
        ));
    notifyListeners();
  }
}
