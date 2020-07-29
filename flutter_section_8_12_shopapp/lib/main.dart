import 'package:flutter/material.dart';
import 'package:fluttersection812shopapp/providers/auth.dart';
import 'package:fluttersection812shopapp/providers/cart.dart';
import 'package:fluttersection812shopapp/providers/orders.dart';
import 'package:fluttersection812shopapp/screens/auth_screen.dart';
import 'package:fluttersection812shopapp/screens/cart_screen.dart';
import 'package:fluttersection812shopapp/screens/edit_product_screen.dart';
import 'package:fluttersection812shopapp/screens/orders_screen.dart';
import 'package:fluttersection812shopapp/screens/products_overview_screen.dart';
import 'package:fluttersection812shopapp/screens/splash_screen.dart';
import 'package:fluttersection812shopapp/screens/user_product_screen.dart';
import 'package:provider/provider.dart';

import './helper/custom_route.dart';
import './providers/product_provider.dart';
import './screens/product_details_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Auth()),
        ChangeNotifierProxyProvider<Auth, ProductProvider>(
          create: (_) => ProductProvider(null, null, []),
          update: (ctx, auth, previousProducts) => ProductProvider(
              auth.token,
              auth.userId,
              previousProducts.items == null ? [] : previousProducts.items),
        ),
        ChangeNotifierProvider(create: (_) => Cart()),
        ChangeNotifierProxyProvider<Auth, Orders>(
          create: (_) => Orders(null, null, []),
          update: (ctx, auth, previousOrders) => Orders(auth.token, auth.userId,
              previousOrders.orders == null ? [] : previousOrders.orders),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, authData, _) => MaterialApp(
          title: 'MyShop',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              pageTransitionsTheme: PageTransitionsTheme(builders: {
                TargetPlatform.android: CustomPageTransitionBuilder(),
                TargetPlatform.iOS: CustomPageTransitionBuilder()
              }),
              primarySwatch: Colors.purple,
              accentColor: Colors.deepOrange,
              fontFamily: 'Lato'),
          home: authData.isAuth
              ? ProductOverviewScreen()
              : FutureBuilder(
                  future: authData.tryAutoLogin(),
                  builder: (ctx, authResult) =>
                      authResult.connectionState == ConnectionState.waiting
                          ? SplashScreen()
                          : AuthScreen(),
                ),
          routes: {
            ProductDetailsScreen.routeName: (ctx) => ProductDetailsScreen(),
            CartScreen.routeName: (ctx) => CartScreen(),
            OrderScreen.routeName: (ctx) => OrderScreen(),
            UserProductScreen.routeName: (ctx) => UserProductScreen(),
            EditProductScreen.routeName: (ctx) => EditProductScreen()
          },
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("MyShop"),
        ),
        body: Center(
          child: Text("center"),
        ));
  }
}
