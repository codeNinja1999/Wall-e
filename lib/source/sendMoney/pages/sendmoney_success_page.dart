import 'package:wall_e/core/color/theme_color.dart';
import 'package:flutter/material.dart';

class SendmoneySuccessPage extends StatefulWidget {
  final VoidCallback backButtonAction;
  const SendmoneySuccessPage({super.key, required this.backButtonAction});

  @override
  State<SendmoneySuccessPage> createState() => _SendmoneySuccessPageState();
}

class _SendmoneySuccessPageState extends State<SendmoneySuccessPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Container(
            height: 500,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: theme.primaryColorLight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Transaction Success',
                  style: theme.textTheme.titleLarge,
                ),
                const SizedBox(height: 20),
                Icon(
                  Icons.download_done,
                  size: 200,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(height: 20),
                Text(
                  textAlign: TextAlign.center,
                  'Yeay congrats! your transaction has been completed Rs. 350.00 has been sent to the recipient',
                  style: TextStyle(color: ThemeAppColors.silver),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    widget.backButtonAction();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColorLight,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 2, color: theme.primaryColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Finish',
                    style: theme.textTheme.titleMedium
                        ?.copyWith(color: theme.primaryColor),
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
