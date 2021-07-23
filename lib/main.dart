import 'package:catalogue_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:catalogue_app/screens/home_screen.dart';
import 'package:catalogue_app/screens/login_screen.dart';
import 'package:catalogue_app/utils/routes.dart';
void main() {
  runApp(MyApp());
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
      },
    );
  }
}
