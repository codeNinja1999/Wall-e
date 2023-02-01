// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:wall_e/core/color/theme_color.dart';
import 'package:wall_e/core/router/app_route.dart';
import 'package:wall_e/source/home/presentation/pages/homescreen.dart';

class TransactionSuccessPage extends StatelessWidget {
  const TransactionSuccessPage({super.key});

  final String amount = 'Rs. 500.00';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Container(
            height: 500,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: theme.primaryColorLight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Transaction Success',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Icon(
                  Icons.download_done,
                  size: 200,
                  color: ThemeAppColors.primaryBlue,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  textAlign: TextAlign.center,
                  'Yeay congrats! your transaction has been completed ${amount} has been added to your wallet',
                  style: TextStyle(color: ThemeAppColors.silver),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoute.homepage);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ThemeAppColors.light,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          width: 2, color: ThemeAppColors.primaryBlue),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Close',
                    style: TextStyle(
                        color: ThemeAppColors.primaryBlue, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
