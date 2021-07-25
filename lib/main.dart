import 'package:catalogue_app/core/store.dart';
import 'package:catalogue_app/screens/cart_screen.dart';
import 'package:catalogue_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:catalogue_app/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
void main() {
  runApp(VxState(
    store: MyStore(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => LoginScreen(),
        MyRoutes.homeRoute : (context) => HomeScreen(),
        MyRoutes.loginRoute : (context) => LoginScreen(),
        MyRoutes.cartRoute : (context) => CartScreen(),
      },
    );
  }
}