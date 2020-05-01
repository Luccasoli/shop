import 'package:flutter/material.dart';
import 'package:shop/data/mockup.dart';
import 'package:shop/models/product.dart';

class Products with ChangeNotifier {
  List<Product> _items = MOCK_PRODUCTS;

  List<Product> get items => [..._items];

  void addProduct(Product product) {
    this._items.add(product);
    this.notifyListeners();
  }
}
