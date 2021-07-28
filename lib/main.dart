import 'package:catalogue_app/core/store.dart';
import 'package:catalogue_app/screens/cart_screen.dart';
import 'package:catalogue_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:catalogue_app/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'screens/details_screen.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:flutter/services.dart';

void main() {
  setPathUrlStrategy();
  runApp(VxState(
    store: MyStore(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp.router(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      routeInformationParser: VxInformationParser(),
      routerDelegate: VxNavigator(
        routes: {
          "/": (_, __) => MaterialPage(child: HomeScreen()),
          MyRoutes.homeRoute: (_, __) => MaterialPage(child: HomeScreen()),
          MyRoutes.loginRoute: (_, __) => MaterialPage(child: LoginScreen()),
          MyRoutes.detailRoute: (uri, __) {
            final catalogue = (VxState.store as MyStore)
                .catalogue
                .getById(int.parse(uri.queryParameters["id"]!));
            return MaterialPage(
                child: DetailScreen(
              catalogue: catalogue,
            ));
          },
          MyRoutes.cartRoute: (_, __) => MaterialPage(child: CartScreen()),
        },
      ),
    );
  }
}
