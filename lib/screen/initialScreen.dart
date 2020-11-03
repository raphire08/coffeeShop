import 'package:flutter/material.dart';
import 'package:ninja_coffee/res/constant.dart';
import 'package:ninja_coffee/widgets/primaryButton.dart';

class InitialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Opacity(
          opacity: 0.2,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              backgroundImage,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              logo2,
              height: 250.0,
            ),
            SizedBox(height: 30.0),
            Image.asset(
              ninjaText,
              width: 300.0,
            ),
            SizedBox(height: 50.0),
            PrimaryButton(
              text: 'TAP TO CONTINUE',
              buttonColor: Colors.black,
              textColor: Colors.white,
              borderColor: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, '/loginScreen');
              },
            )
          ],
        ),
      ],
    );
  }
}
