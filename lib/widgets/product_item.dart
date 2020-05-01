import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/constants/routes.dart';
import 'package:shop/models/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Get.toNamed(Routes.PRODUCT_DETAIL, arguments: this.product);
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          leading: IconButton(
            icon: Icon(
              Icons.favorite,
              color: theme.accentColor,
            ),
            onPressed: () {},
          ),
          title: Text(
            this.product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: theme.accentColor,
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
