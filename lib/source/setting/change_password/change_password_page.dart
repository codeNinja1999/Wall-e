import 'package:wall_e/core/app_size/app_size.dart';
import 'package:wall_e/source/widget/appbar/appbar.dart';
import 'package:wall_e/source/widget/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:wall_e/source/widget/textfield/custom_textformfield_widget.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: MyAppBar(
        title: 'Change Password',
        leadingIcon: true,
        onPressed: () => Navigator.pop(context),
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: AppSize.viewMargin,
              right: AppSize.viewMargin,
              top: AppSize.spacedViewSpacing,
            ),
            child: CustomTextField(
              keyboardType: TextInputType.emailAddress,
              labelText: 'Current password',
              labelStyle: theme.textTheme.labelLarge,
              isObscure: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: AppSize.viewMargin,
              right: AppSize.viewMargin,
              top: AppSize.inset,
            ),
            child: CustomTextField(
              keyboardType: TextInputType.emailAddress,
              labelText: 'Change password',
              labelStyle: theme.textTheme.labelLarge,
              isObscure: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: AppSize.viewMargin,
              right: AppSize.viewMargin,
              top: AppSize.inset,
            ),
            child: CustomTextField(
              keyboardType: TextInputType.emailAddress,
              labelText: 'verify password',
              labelStyle: theme.textTheme.labelLarge,
              isObscure: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: AppSize.viewMargin,
              right: AppSize.viewMargin,
              top: AppSize.spacedViewSpacing,
            ),
            child: CustomElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'You have successfully change the password',
                      style: theme.textTheme.bodyLarge
                          ?.copyWith(color: theme.primaryColorLight),
                    ),
                  ),
                );
              },
              buttonText: 'Change Password',
            ),
          ),
        ],
      )),
    );
  }
}
