import 'package:flutter/material.dart';
import 'package:wall_e/core/color/theme_color.dart';

class ToggleLoginSignupWidget extends StatelessWidget {
  const ToggleLoginSignupWidget(
      {super.key, required this.accountTypeText, this.onTap, required this.buttonText});

  final String accountTypeText;
  final Function()? onTap;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          accountTypeText,
          style: const TextStyle(fontSize: 12),
        ),

        //clickable button
        InkWell(
          onTap: onTap,
          child: Text(
            buttonText,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: ThemeAppColors.primaryBlue),
          ),
        ),
      ],
    );
  }
}
