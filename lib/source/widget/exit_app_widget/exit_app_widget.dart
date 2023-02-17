import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
              Text(
                'Wall-e',
                style: theme.textTheme.bodyLarge,
              ),
              const SizedBox(height: 20),
              Text(
                'Are you sure you want to exit?',
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
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
                        style: theme.textTheme.labelLarge,
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
                        style: theme.textTheme.labelLarge,
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
