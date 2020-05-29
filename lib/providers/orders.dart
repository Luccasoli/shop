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

  void addOrder(Cart cart) {
    _orders.insert(
        0,
        OrderItem(
          id: Random().nextDouble().toString(),
          total: cart.totalAmount,
          products: cart.items.values,
          date: DateTime.now(),
        ));
    notifyListeners();
  }
}
