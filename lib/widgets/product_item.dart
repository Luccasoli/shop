import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/constants/routes.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/providers/product.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(Routes.PRODUCT_DETAIL, arguments: product);
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          leading: Consumer<Product>(
            builder: (context, product, _) => IconButton(
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: theme.accentColor,
              ),
              onPressed: () {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        '${product.title} foi ${!product.isFavorite ? 'adicionado aos' : 'removido dos'} favoritos!'),
                    behavior: SnackBarBehavior.floating,
                    duration: Duration(milliseconds: 2000),
                  ),
                );

                product.toggleFavorite();
              },
            ),
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.add_shopping_cart,
              color: theme.accentColor,
            ),
            onPressed: () {
              cart.addItem(product);
            },
          ),
        ),
      ),
    );
  }
}
