import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ninja_coffee/res/constant.dart';
import 'package:ninja_coffee/widgets/orderedCard.dart';
import 'package:ninja_coffee/widgets/paymentAvatar.dart';
import 'package:ninja_coffee/widgets/bottomBar.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

bool isPaymentDone = false;

class _PaymentScreenState extends State<PaymentScreen> {
  TapGestureRecognizer _tapRecognizer;

  @override
  void initState() {
    super.initState();
    _tapRecognizer = TapGestureRecognizer()..onTap = _handleTap;
  }

  @override
  void dispose() {
    _tapRecognizer.dispose();
    super.dispose();
  }

  void _handleTap() {
    Navigator.popUntil(context, ModalRoute.withName('/menuScreen'));
  }

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
                    OrderedCard(
                      itemName: item[0],
                      image: item[1],
                    ),
                    SizedBox(height: 20.0),
                    isPaymentDone == false
                        ? Column(
                            children: [
                              Text(
                                'PAY BILL USING',
                                style: common,
                              ),
                              SizedBox(height: 10.0),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 40.0),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            setState(() {
                                              isPaymentDone = true;
                                            });
                                          },
                                          child: PaymentAvatar(image: cod)),
                                      InkWell(
                                          onTap: () {
                                            setState(() {
                                              isPaymentDone = true;
                                            });
                                          },
                                          child: PaymentAvatar(image: card)),
                                      InkWell(
                                          onTap: () {
                                            setState(() {
                                              isPaymentDone = true;
                                            });
                                          },
                                          child: PaymentAvatar(image: paytm)),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              SizedBox(height: 5.0),
                              Text(
                                'YOUR ORDER HAS BEEN CONFIRMED',
                                style: itemHeading,
                              ),
                              SizedBox(height: 5.0),
                              RichText(
                                text: TextSpan(
                                  style: common,
                                  text: 'Go back to ',
                                  children: [
                                    TextSpan(
                                      text: 'Menu',
                                      style: TextStyle(color: primaryColor),
                                      recognizer: _tapRecognizer,
                                    ),
                                    TextSpan(text: ' to see other items')
                                  ],
                                ),
                              )
                            ],
                          )
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
