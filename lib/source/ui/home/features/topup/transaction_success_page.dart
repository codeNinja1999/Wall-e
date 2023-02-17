import 'package:flutter/material.dart';
import 'package:wall_e/core/app_size/app_size.dart';
import 'package:wall_e/core/color/theme_color.dart';
import 'package:wall_e/core/router/app_route.dart';
import 'package:wall_e/source/resources/image_extension.dart';
import 'package:wall_e/source/widget/appbar/appbar.dart';

class TransactionSuccessPage extends StatelessWidget {
  const TransactionSuccessPage({super.key});

  final String amount = 'Rs. 500.00';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: MyAppBar(
        leadingIcon: true,
        title: 'Transcation Success',
        onPressed: () => Navigator.of(context).pop(),
      ),
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
               Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppSize.inset),
                  child: Image.asset(
                    ImageExtension.transactionSuccess,
                    height: AppSize.inset * 10,
                    width: AppSize.inset * 10,
                  ),
                ),
                const SizedBox(
                  height: 20
                ),
                Text(
                  textAlign: TextAlign.center,
                  'Yeay congrats! your transaction has been completed ${amount} has been added to your wallet',
                  style: TextStyle(color: ThemeAppColors.silver),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () =>
                    Navigator.pushNamed(context, AppRoute.homeScreen),
                  
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
