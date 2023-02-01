// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:wall_e/core/color/theme_color.dart';
import 'package:wall_e/core/icons/app_icons.dart';
import 'package:wall_e/source/home/presentation/pages/transaction_success_page.dart';

class TopUpPage extends StatefulWidget {
  const TopUpPage({super.key});

  @override
  State<TopUpPage> createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {
  int activeState = 0;
  bool isActive = false;
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Expanded(
                          child: Row(
                            children: [
                              Icon(AppIcon.arrowBack),
                              Text(
                                'Back',
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 80,
                      ),
                      Text(
                        'Top Up',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Insert amount (Min. Rs 500)',
                    style: TextStyle(color: ThemeAppColors.secondary),
                  ),
                  TextField(
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                          color: ThemeAppColors.secondary, fontSize: 20),
                      hintText: 'Rs.',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Amount',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'Instantly add the nominal',
                    style: TextStyle(color: ThemeAppColors.secondary),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            amountController.text = '500';
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            // padding: EdgeInsets.all(10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: ThemeAppColors.fillColor),
                        child: Text(
                          'Rs. 500',
                          style: TextStyle(color: ThemeAppColors.silver),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            amountController.text = '1000';
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            // padding: EdgeInsets.all(10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: ThemeAppColors.fillColor),
                        child: Text(
                          'Rs. 1000',
                          style: TextStyle(color: ThemeAppColors.silver),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            amountController.text = '5000';
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            // padding: EdgeInsets.all(10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: ThemeAppColors.fillColor),
                        child: Text(
                          'Rs. 5,000',
                          style: TextStyle(color: ThemeAppColors.silver),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            amountController.text = '10000';
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            // padding: EdgeInsets.all(10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: ThemeAppColors.fillColor),
                        child: Text(
                          'Rs. 10,000',
                          style: TextStyle(color: ThemeAppColors.silver),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            amountController.text = '20000';
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            // padding: EdgeInsets.all(10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: ThemeAppColors.fillColor),
                        child: Text(
                          'Rs. 20,000',
                          style: TextStyle(color: ThemeAppColors.silver),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            amountController.text = '25000';
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            // padding: EdgeInsets.all(10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: ThemeAppColors.fillColor),
                        child: Text(
                          'Rs. 25,000',
                          style: TextStyle(color: ThemeAppColors.silver),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: theme.primaryColorLight,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    builder: (context) {
                      return Checkout();
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ThemeAppColors.primaryBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 60,
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ThemeAppColors.light,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Checkout extends StatelessWidget {
  const Checkout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          //Payment Method
          Text(
            'Payment Method',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),

          //Visa ****** 1234
          Row(
            children: [
              Container(
                height: 30,
                width: 50,
                decoration: BoxDecoration(
                  color: ThemeAppColors.primaryBlue,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  textAlign: TextAlign.center,
                  'Visa Method',
                  style: TextStyle(
                      fontSize: 18,
                      color: ThemeAppColors.light,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                '**** **** **** 1234',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),

          SizedBox(
            height: 10,
          ),

          //divider
          Divider(),

          SizedBox(
            height: 20,
          ),

          //Payment Summary
          Text(
            'Payment Summary',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),

          SizedBox(
            height: 10,
          ),

          //Top up  Rs. 500
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Top Up',
                style: TextStyle(color: ThemeAppColors.secondary),
              ),
              Text(
                'Rs. 500.00',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),

          SizedBox(
            height: 10,
          ),

          //Admin fee Rs.5
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Admin fee',
                style: TextStyle(color: ThemeAppColors.secondary),
              ),
              Text(
                'Rs. 5.00',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),

          SizedBox(
            height: 10,
          ),

          //Total Rs. 505
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: TextStyle(
                  color: ThemeAppColors.primaryBlue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Rs. 505.00',
                style: TextStyle(
                    color: ThemeAppColors.primaryBlue,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),

          SizedBox(
            height: 30,
          ),

          //Checkout
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TransactionSuccessPage(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: ThemeAppColors.primaryBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 60,
              child: Text(
                'Checkout',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ThemeAppColors.light,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
