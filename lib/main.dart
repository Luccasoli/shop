import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/constants/font_family.dart';
import 'package:shop/constants/routes.dart';
import 'package:shop/views/product_details_screen.dart';
import 'package:shop/views/products_overview_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Get.key,
      title: 'Minha Loja',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.deepOrange,
        fontFamily: FONT_FAMILY.LATO,
      ),
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return GetRoute(
              page: ProductsOverviewScreen(),
            );
          case Routes.PRODUCT_DETAIL:
            return GetRoute(
              settings: settings,
              page: ProductDetailsScreen(),
              transition: Transition.fade,
            );
          default:
            return GetRoute(
              settings: settings,
              transition: Transition.fade,
              page: Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ),
            );
        }
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
