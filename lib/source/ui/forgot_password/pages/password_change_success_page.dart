import 'package:wall_e/core/app_size/app_size.dart';
import 'package:wall_e/core/router/app_route.dart';
import 'package:wall_e/source/widget/appbar/appbar.dart';
import 'package:wall_e/source/widget/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class PasswordChangeSuccess extends StatefulWidget {
  const PasswordChangeSuccess({super.key});

  @override
  State<PasswordChangeSuccess> createState() => _PasswordChangeSuccessState();
}

class _PasswordChangeSuccessState extends State<PasswordChangeSuccess> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: MyAppBar(
        title: 'Success',
        leadingIcon: true,
        onPressed: () => Navigator.pop(context),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
                padding: EdgeInsets.only(
                  top: AppSize.spacedViewSpacing,
                  left: AppSize.viewMargin,
                  right: AppSize.viewMargin,
                ),
                child: Text('You have successfully reset your password')),
            Padding(
              padding: const EdgeInsets.only(
                top: AppSize.spacedViewSpacing,
                left: AppSize.viewMargin,
                right: AppSize.viewMargin,
              ),
              child: CustomElevatedButton(
                buttonText: 'Done',
                onPressed: () =>
                    Navigator.pushNamed(context, AppRoute.loginScreen),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
