// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:wall_e/core/color/theme_color.dart';

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget(
      {super.key, required this.buttonText, required this.onPressed});

  final String buttonText;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: ThemeAppColors.primaryBlue,
        textStyle: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      child: Text(buttonText),
    );
  }
}
