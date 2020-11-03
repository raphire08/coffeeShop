import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:ninja_coffee/res/constant.dart';
import 'package:ninja_coffee/widgets/bottomBar.dart';

class MenuScreen extends StatelessWidget {
  static final Map<String, String> imgList = {
    'COFFEE': coffee_01,
    'TEA': coffee_02,
    'HOT CHOCOLATE': coffee_03,
    'ORGANIC TEA': coffee_04,
    'COOKIES': coffee_05,
    'MOCHA': coffee_06,
  };

  final List<Widget> imageSliders = imgList.keys
      .map(
        (itemName) => Builder(builder: (BuildContext context) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/subMenuScreen');
            },
            child: Container(
              margin: EdgeInsets.all(5.0),
              child: Stack(
                clipBehavior: Clip.antiAlias,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(
                      imgList[itemName],
                      //fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    bottom: 10.0,
                    left: 10.0,
                    right: 60.0,
                    child: Container(
                      height: 50.0,
                      decoration: ShapeDecoration(
                        color: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(color: borderColor),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      child: FittedBox(
                        alignment: Alignment.centerLeft,
                        fit: BoxFit.contain,
                        child: Text(
                          '$itemName',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: screenBackground,
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.menu),
                      iconSize: 30.0,
                      onPressed: () {},
                    ),
                    Text('Menu', style: heading),
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
              flex: 12,
              child: Container(
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 400.0,
                    viewportFraction: 0.6,
                    autoPlay: false,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.scale,
                  ),
                  items: imageSliders,
                ),
              ),
            ),
            BottomBar(),
          ],
        ),
      ),
    );
  }
}
