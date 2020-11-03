import 'package:flutter/material.dart';
import 'package:ninja_coffee/res/constant.dart';

class ItemCard extends StatelessWidget {
  ItemCard({this.itemName, this.image});
  final String itemName;
  final String image;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/orderScreen',
            arguments: [itemName, image]);
      },
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(color: Colors.white),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          height: 90.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30.0,
                backgroundImage: AssetImage(image),
              ),
              SizedBox(width: 20.0),
              RichText(
                text: TextSpan(
                  text: '$itemName\n',
                  style: itemHeading,
                  children: [
                    TextSpan(
                      text: ('(S)50 / (R)80'),
                      style: common,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
