// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wall_e/core/color/theme_color.dart';

class PopApp {
  static Future<bool> popApp(BuildContext context) async {
    final theme = Theme.of(context);
    final bool? confirmExit = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: theme.backgroundColor,
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              //text
              Text(
                'Wall-e',
                style: TextStyle(
                    color: theme.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),

              //are you sure
              Text(
                'Are you sure you want to exit?',
              ),
              SizedBox(
                height: 20,
              ),

              //yes no button

              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        SystemNavigator.pop();
                        // Navigator.of(context).pop(true);
                      },
                      child: Text(
                        textAlign: TextAlign.end,
                        'YES',
                        style: TextStyle(
                            color: theme.primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop(false);
                      },
                      child: Text(
                        textAlign: TextAlign.end,
                        'NO',
                        style: TextStyle(
                            color: theme.primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
    return confirmExit ?? false;
  }
}
