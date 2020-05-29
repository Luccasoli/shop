import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/constants/routes.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/providers/dynamic_theme.dart';
import 'package:shop/providers/orders.dart';
import 'package:shop/providers/products.dart';
import 'package:shop/views/cart_screen.dart';
import 'package:shop/views/product_details_screen.dart';
import 'package:shop/views/products_overview_screen.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => Products(),
          ),
          ChangeNotifierProvider(
            create: (context) => Cart(),
          ),
          ChangeNotifierProvider(
            create: (context) => Orders(),
          ),
          ChangeNotifierProvider(
            create: (context) => DynamicTheme(),
          ),
        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DynamicTheme>(
      builder: (context, themeInstance, _) => MaterialApp(
        title: 'Minha Loja',
        theme: themeInstance.theme,
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => ProductsOverviewScreen(),
          Routes.PRODUCT_DETAIL: (context) => ProductDetailsScreen(),
          Routes.CART: (context) => CartScreen(),
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Loja'),
      ),
      body: Center(
        child: Text('Vamos desenvolver uma loja?'),
      ),
    );
  }
}
