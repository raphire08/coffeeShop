import 'package:flutter/material.dart';
import 'package:ninja_coffee/res/constant.dart';
import 'package:ninja_coffee/widgets/ItemCard.dart';
import 'package:ninja_coffee/widgets/bottomBar.dart';

class SubMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: screenBackground,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          child: Column(children: [
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
                    Text('Coffee', style: heading),
                    IconButton(
                      icon: Icon(Icons.search),
                      iconSize: 30.0,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 18,
              child: ListView(
                children: [
                  Column(
                    children: [
                      ItemCard(
                        image: coffee_01,
                        itemName: 'Latte / Cappuccino',
                      ),
                      SizedBox(height: 10.0),
                      ItemCard(
                        image: coffee_02,
                        itemName: 'Flat White',
                      ),
                      SizedBox(height: 10.0),
                      ItemCard(
                        image: coffee_03,
                        itemName: 'Americano',
                      ),
                      SizedBox(height: 10.0),
                      ItemCard(
                        image: coffee_04,
                        itemName: 'Mocha',
                      ),
                      SizedBox(height: 10.0),
                      ItemCard(
                        image: coffee_05,
                        itemName: 'Espresso',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            BottomBar(),
          ]),
        ),
      ),
    );
  }
}
