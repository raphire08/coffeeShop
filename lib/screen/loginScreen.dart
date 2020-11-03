import 'package:flutter/material.dart';
import 'package:ninja_coffee/widgets/background.dart';
import 'package:ninja_coffee/res/constant.dart';
import 'package:ninja_coffee/widgets/primaryButton.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: screenBackground,
      resizeToAvoidBottomInset: true,
      body: Stack(alignment: AlignmentDirectional.topCenter, children: [
        CustomPaint(
          painter: MyPainter(),
          child: Container(),
        ),
        SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50.0),
                Text(
                  'Welcome to',
                  style: heading,
                ),
                SizedBox(height: 15.0),
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage(
                    logo,
                  ),
                ),
                SizedBox(height: 15.0),
                SizedBox(
                  width: screenWidth * 0.8,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      'PLEASE LOGIN TO ORDER COFFEE',
                      style: heading,
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
                SizedBox(
                  width: screenWidth * 0.8,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '  Name',
                          style: common,
                        ),
                        SizedBox(height: 5.0),
                        FormField(
                          hintText: 'Enter Name ..',
                          prefixText: '  ',
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          '  Phone',
                          style: common,
                        ),
                        SizedBox(height: 5.0),
                        FormField(
                          hintText: '10 digit number',
                          prefixText: '    +91-  ',
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          width: screenWidth * 0.8,
                          height: 50.0,
                          child: PrimaryButton(
                              text: 'LOGIN',
                              buttonColor: primaryColor,
                              textColor: Colors.white,
                              borderColor: primaryColor,
                              onPressed: () {
                                Navigator.pushNamed(context, '/menuScreen');
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  "Don't have an account? Register",
                  style: para,
                ),
                SizedBox(height: 100.0),
                // SizedBox(height: 20.0),
                // Text(
                //   'Or Login with',
                //   style: TextStyle(color: Colors.grey),
                // ),
                // Row(children: [
                //   PrimaryButton(
                //     text: 'Google',
                //     textColor: Colors.white,
                //     buttonColor: Colors.red,
                //     borderColor: Colors.red,
                //     onPressed: () {},
                //   ),
                //   PrimaryButton(
                //     text: 'Facebook',
                //     textColor: Colors.white,
                //     buttonColor: Colors.blue,
                //     borderColor: Colors.blue,
                //     onPressed: () {},
                //   ),
                // ])
                Label(text: 'Dedicated to Quality'),
                SizedBox(height: 5.0),
                Label(text: 'Coffee with you in mind'),
                SizedBox(height: 5.0),
                Label(text: 'More than Drinks'),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

class Label extends StatelessWidget {
  const Label({
    this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        SizedBox(width: screenWidth * 0.25),
        CircleAvatar(
            backgroundColor: Colors.white,
            radius: 12.0,
            child: Image.asset(coffeeIcon)),
        SizedBox(width: 10.0),
        Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
      ],
    );
  }
}

class FormField extends StatelessWidget {
  const FormField({
    Key key,
    this.hintText,
    this.prefixText,
  }) : super(key: key);

  final String hintText;
  final String prefixText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: hintTextColor),
        prefixIcon: Text(prefixText),
        prefixIconConstraints: BoxConstraints(minHeight: 0.0, minWidth: 0.0),
        filled: true,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: primaryColor,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      cursorColor: primaryColor,
      cursorWidth: 1.5,
      validator: null,
      onSaved: null,
      autovalidateMode: null,
    );
  }
}
