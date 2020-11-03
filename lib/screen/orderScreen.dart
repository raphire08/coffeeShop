import 'package:flutter/material.dart';
import 'package:ninja_coffee/res/constant.dart';
import 'package:ninja_coffee/widgets/bottomBar.dart';
import 'package:ninja_coffee/widgets/orderCard.dart';
import 'package:ninja_coffee/widgets/primaryButton.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> item = ModalRoute.of(context).settings.arguments;
    return SafeArea(
      child: Scaffold(
        backgroundColor: screenBackground,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        iconSize: 30.0,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Text('Order', style: heading),
                      SizedBox(width: 10.0),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 12,
                child: Column(
                  children: [
                    OrderCard(
                      itemName: item[0],
                      image: item[1],
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      child: PrimaryButton(
                        text: 'PROCEED TO PAY',
                        buttonColor: primaryColor,
                        borderColor: primaryColor,
                        textColor: Colors.white,
                        onPressed: () {
                          Navigator.pushNamed(context, '/locationScreen',
                              arguments: item);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              BottomBar(),
            ],
          ),
        ),
      ),
    );
  }
}
