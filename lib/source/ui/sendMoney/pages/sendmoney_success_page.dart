import 'package:wall_e/core/app_size/app_size.dart';
import 'package:flutter/material.dart';
import 'package:wall_e/source/resources/image_extension.dart';
import 'package:wall_e/source/widget/appbar/appbar.dart';

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
      appBar: MyAppBar(
        title: 'Transaction Success',
        leadingIcon: true,
        onPressed: () => Navigator.pop(context),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSize.viewMargin),
          child: Container(
            height: 500,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSize.inset,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.viewMargin),
                color: theme.primaryColorLight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                const SizedBox(height: 20),
                Text(
                  textAlign: TextAlign.center,
                  'Yeay congrats! your transaction has been completed Rs. 350.00 has been sent to the recipient',
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => widget.backButtonAction(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColorLight,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 2, color: theme.primaryColor),
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
