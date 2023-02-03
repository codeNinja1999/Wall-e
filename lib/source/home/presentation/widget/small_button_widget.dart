// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:wall_e/core/color/theme_color.dart';
import 'package:wall_e/source/home/presentation/pages/bill_payment.dart';

class SmallButtonWidget extends StatelessWidget {
  const SmallButtonWidget({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final IconData? icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BillPaymentPage(),
            ),
          ),
          child: Container(
            height: 45,
            width: 45,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: ThemeAppColors.light,
              boxShadow: [
                BoxShadow(
                  blurRadius: 2,
                  color: Colors.black12,
                  offset: Offset(1, 2),
                ),
                BoxShadow(
                  color: ThemeAppColors.light,
                  offset: Offset(1, 0),
                ),
              ],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(
              icon,
              color: theme.primaryColor,
              size: 25,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        //text
        Text(
          text,
        ),
      ],
    );
  }
}
