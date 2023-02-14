// ignore_for_file: prefer_const_constructors

import 'package:wall_e/core/app_size/app_size.dart';
import 'package:flutter/material.dart';
import 'package:wall_e/core/color/theme_color.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key, required this.buttonText, required this.onPressed});

  final String buttonText;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.symmetric(
            horizontal: AppSize.cornerRadiusSmall, vertical: AppSize.inset),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.cornerRadiusMedium),
        ),
        backgroundColor: ThemeAppColors.primaryBlue,
        textStyle: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      child: Text(buttonText),
    );
  }
}
