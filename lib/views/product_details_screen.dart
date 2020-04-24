import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/models/product.dart';

class ProductDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(2);
    print(Get.arguments);
    final Product product = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
    );
  }
}
