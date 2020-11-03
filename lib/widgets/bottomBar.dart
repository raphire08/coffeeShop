import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomBarButton(icon: Icons.menu_book, text: 'MENU'),
            BottomBarButton(icon: Icons.restaurant_menu, text: 'ORDERS'),
            BottomBarButton(icon: Icons.local_offer, text: 'OFFERS'),
            BottomBarButton(icon: Icons.loyalty, text: 'LOYALTY'),
          ],
        ),
      ),
    );
  }
}

class BottomBarButton extends StatelessWidget {
  BottomBarButton({this.icon, this.text});

  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 35.0,
        ),
        SizedBox(height: 8.0),
        Text(
          text,
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
