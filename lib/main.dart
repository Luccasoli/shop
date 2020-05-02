import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shop/constants/font_family.dart';
import 'package:shop/constants/routes.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/providers/dynamic_theme.dart';
import 'package:shop/providers/products.dart';
import 'package:shop/views/product_details_screen.dart';
import 'package:shop/views/products_overview_screen.dart';

void main() => runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (context) => Products(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => DynamicTheme(),
        ),
      ], child: MyApp()),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DynamicTheme>(
      builder: (context, themeInstance, _) => MaterialApp(
        navigatorKey: Get.key,
        title: 'Minha Loja',
        navigatorObservers: [GetObserver()],
        theme: themeInstance.theme,
        initialRoute: '/',
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/':
              return GetRoute(
                page: ProductsOverviewScreen(),
              );
            case Routes.PRODUCT_DETAIL:
              return GetRoute(
                transitionDuration: Duration(milliseconds: 200),
                settings: settings,
                page: ProductDetailsScreen(),
              );
            default:
              return GetRoute(
                transitionDuration: Duration(milliseconds: 200),
                settings: settings,
                page: Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ),
              );
          }
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
