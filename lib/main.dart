import 'package:flutter/material.dart';
import 'package:shop/constants/font_family.dart';
import 'package:shop/constants/routes.dart';
import 'package:shop/views/product_details_screen.dart';
import 'package:shop/views/products_overview_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minha Loja',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.deepOrange,
        fontFamily: FONT_FAMILY.LATO,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => ProductsOverviewScreen(),
        Routes.PRODUCT_DETAIL: (context) => ProductDetailsScreen(),
      },
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
