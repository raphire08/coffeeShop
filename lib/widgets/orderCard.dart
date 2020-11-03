import 'package:flutter/material.dart';
import 'package:ninja_coffee/res/constant.dart';

class OrderCard extends StatelessWidget {
  OrderCard({this.itemName, this.image});
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
        height: 420.0,
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
                      SizedBox(height: 15.0),
                      Text(
                        'Item description will come here',
                        style: para,
                      )
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
                  'Add Quantity',
                  style: common,
                ),
                Row(
                  children: [
                    Container(
                      height: 40.0,
                      width: 40.0,
                      child: Icon(
                        Icons.remove,
                        size: 15.0,
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: minusButtonColor, width: 0.5),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            bottomLeft: Radius.circular(10.0)),
                        color: minusButtonColor,
                      ),
                    ),
                    Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                        border: Border.symmetric(
                          horizontal:
                              BorderSide(color: minusButtonColor, width: 0.5),
                        ),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          '0',
                          style: common,
                        ),
                      ),
                    ),
                    Container(
                      height: 40.0,
                      width: 40.0,
                      child: Icon(
                        Icons.add,
                        size: 15.0,
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: minusButtonColor, width: 0.5),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0)),
                        color: primaryColor,
                      ),
                    ),
                  ],
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
                VariantContainer(
                  initialValue: 'Small',
                  menuList: ['Small', 'Regular'],
                )
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
                VariantContainer(
                  initialValue: 'Chocolate',
                  menuList: ['Chocolate', 'Vanilla', 'Strawberry'],
                )
              ],
            ),
            SizedBox(height: 40.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Bill',
                  style: itemHeading,
                ),
                Text(
                  '--',
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

class VariantContainer extends StatelessWidget {
  const VariantContainer({Key key, this.initialValue, this.menuList})
      : super(key: key);

  final String initialValue;
  final List<String> menuList;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 120,
      decoration: BoxDecoration(
        border: Border.all(color: minusButtonColor),
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 7,
            child: Text(
              initialValue,
              style: para,
            ),
          ),
          Expanded(
            flex: 3,
            child: PopupMenuButton(
              icon: Icon(
                Icons.keyboard_arrow_down,
              ),
              padding: EdgeInsets.all(0.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(color: Colors.white),
              ),
              itemBuilder: (context) {
                return menuList.map((String value) {
                  return PopupMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList();
              },
            ),
          ),
        ],
      ),
    );
  }
}
