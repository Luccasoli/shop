import 'package:flutter/material.dart';
import 'package:shop/widgets/product_grid.dart';

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool _showFavoriteOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Minha loja',
        ),
        actions: <Widget>[
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
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ProductGrid(_showFavoriteOnly),
      ),
    );
  }
}
