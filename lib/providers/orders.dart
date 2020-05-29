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
  List<OrderItem> _orders = [];

  List<OrderItem> get orders => [..._orders];

  void addOrder(List<CartItem> products, double total) {
    _orders.insert(
        0,
        OrderItem(
          id: Random().nextDouble().toString(),
          total: total,
          products: products,
          date: DateTime.now(),
        ));
    notifyListeners();
  }
}
