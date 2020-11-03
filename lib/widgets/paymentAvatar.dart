import 'package:flutter/material.dart';
import 'package:ninja_coffee/res/constant.dart';

class PaymentAvatar extends StatelessWidget {
  PaymentAvatar({this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: CircleAvatar(
        radius: 36.0,
        backgroundColor: primaryColor,
        child: CircleAvatar(
          radius: 35.0,
          backgroundColor: screenBackground,
          foregroundColor: primaryColor,
          backgroundImage: AssetImage(image),
        ),
      ),
    );
  }
}
