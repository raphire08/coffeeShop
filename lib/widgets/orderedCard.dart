import 'package:flutter/material.dart';
import 'package:ninja_coffee/res/constant.dart';

class OrderedCard extends StatelessWidget {
  OrderedCard({this.itemName, this.image});
  final String itemName;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: BorderSide(color: Colors.white),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        height: 360.0,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage(image),
                  ),
                ),
                SizedBox(width: 20.0),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Quantity',
                  style: common,
                ),
                Text(
                  '2',
                  style: common,
                )
              ],
            ),
            SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Size',
                  style: common,
                ),
                Text(
                  'Small',
                  style: common,
                ),
              ],
            ),
            SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Flavor',
                  style: common,
                ),
                Text(
                  'Chocolate',
                  style: common,
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Divider(thickness: 1.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Bill',
                  style: itemHeading,
                ),
                Text(
                  '100',
                  style: itemHeading,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
