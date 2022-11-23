import 'package:flutter/material.dart';
import 'package:wafirufahmi_portalberita/login_view.dart';
import 'splashscreen_view.dart';
import 'menu/menu.dart';
import 'menu/detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    MenuPage.tag: (context) => MenuPage(),
    // Detail: (context) => Detail(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: routes,
    );
  }
}

class MyStatlesWidget extends StatelessWidget {
  const MyStatlesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
