import 'package:flutter/material.dart';
import 'package:ninja_coffee/res/constant.dart';
import 'package:ninja_coffee/screen/menuScreen.dart';
import 'package:ninja_coffee/screen/initialScreen.dart';
import 'package:ninja_coffee/screen/loginScreen.dart';
import 'package:ninja_coffee/screen/subMenuScreen.dart';
import 'package:ninja_coffee/screen/orderScreen.dart';
import 'package:ninja_coffee/screen/locationScreen.dart';
import 'package:ninja_coffee/screen/paymentScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ninja Coffee',
      theme: ThemeData(
        primaryColor: primaryColor,
      ),
      home: InitialScreen(),
      routes: <String, WidgetBuilder>{
        '/initialScreen': (BuildContext context) => InitialScreen(),
        '/loginScreen': (BuildContext context) => LoginScreen(),
        '/menuScreen': (BuildContext context) => MenuScreen(),
        '/subMenuScreen': (BuildContext context) => SubMenuScreen(),
        '/orderScreen': (BuildContext context) => OrderScreen(),
        '/locationScreen': (BuildContext context) => LocationScreen(),
        '/paymentScreen': (BuildContext context) => PaymentScreen(),
      },
    );
  }
}
