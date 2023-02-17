import 'package:flutter/material.dart';
import 'package:wall_e/core/color/theme_color.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);
  final IconData? icon;
  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            height: 45,
            width: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: ThemeAppColors.light,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(
              icon,
              color: ThemeAppColors.primaryBlue,
              size: 25,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(color: ThemeAppColors.light),
        ),
      ],
    );
  }
}
