import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/constants/routes.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/providers/dynamic_theme.dart';
import 'package:shop/widgets/badge.dart';
import 'package:shop/widgets/product_grid.dart';

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool _showFavoriteOnly = false;
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Minha loja',
        ),
        actions: <Widget>[
          Consumer<DynamicTheme>(
            builder: (context, theme, _) => Row(
              children: <Widget>[
                Icon(Icons.brightness_7),
                Switch.adaptive(
                  value: isDarkMode,
                  onChanged: (value) {
                    setState(() {
                      isDarkMode = value;
                    });
                    if (isDarkMode) {
                      theme.setDarkTheme();
                    } else {
                      theme.setDefaultTheme();
                    }
                  },
                ),
                Icon(Icons.brightness_3),
              ],
            ),
          ),
          PopupMenuButton(
            onSelected: (bool selectedValue) {
              setState(() {
                _showFavoriteOnly = selectedValue;
              });
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Somente Favoritos'),
                value: true,
              ),
              PopupMenuItem(
                child: Text('Todos'),
                value: false,
              ),
            ],
          ),
          Consumer<Cart>(
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.CART);
              },
            ),
            builder: (context, cart, child) => Badge(
              child: child,
              value: cart.itemCount.toString(),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ProductGrid(_showFavoriteOnly),
      ),
    );
  }
}
