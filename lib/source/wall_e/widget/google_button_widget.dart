// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:wall_e/core/color/theme_color.dart';
import 'package:wall_e/source/wall_e/resources/image_extension.dart';

class GoogleButtonWidget extends StatelessWidget {
  const GoogleButtonWidget({
    super.key,
    required this.googleString,
  });

  final String googleString;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Not Implemented yet'),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: ThemeAppColors.light,
        minimumSize: Size(double.infinity, 45),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //google logo
          CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 15,
            child: Image.asset(
              ImageExtension.googleIcon,
            ),
          ),
          SizedBox(
            width: 20,
          ),

          //button
          Text(
            googleString,
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
