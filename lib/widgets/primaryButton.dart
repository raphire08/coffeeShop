import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  PrimaryButton(
      {this.text,
      this.onPressed,
      this.buttonColor,
      this.textColor,
      this.borderColor});

  final String text;
  final Function onPressed;
  final Color buttonColor;
  final Color textColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      color: buttonColor,
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w900,
          fontSize: 18.0,
          letterSpacing: 3.0,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: BorderSide(color: borderColor),
      ),
    );
  }
}
