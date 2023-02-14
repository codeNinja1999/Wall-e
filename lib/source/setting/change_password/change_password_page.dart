import 'package:wall_e/core/app_size/app_size.dart';
import 'package:flutter/material.dart';
import 'package:wall_e/source/widget/appbar/appbar.dart';
import 'package:wall_e/source/widget/custom_text_button.dart';
import 'package:wall_e/source/widget/textfield/custom_textformfield_widget.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  bool _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: MyAppBar(
        title: 'Change Password',
      
        onPressed: () => Navigator.pop(context),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.only(
            left: AppSize.viewMargin,
            right: AppSize.viewMargin,
            top: AppSize.viewMargin,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(AppSize.inset),
                child: CustomTextField(
                  keyboardType: TextInputType.emailAddress,
                  labelText: 'Current password',
                  labelStyle: theme.textTheme.labelLarge,
                  isObscure: _passwordVisible ? false : true,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                    child: Icon(
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(AppSize.inset),
                child: CustomTextField(
                  keyboardType: TextInputType.emailAddress,
                  labelText: 'Change password',
                  labelStyle: theme.textTheme.labelLarge,
                  isObscure: _passwordVisible ? false : true,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                    child: Icon(
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(AppSize.inset),
                child: CustomTextField(
                  keyboardType: TextInputType.emailAddress,
                  labelText: 'verify password',
                  labelStyle: theme.textTheme.labelLarge,
                  isObscure: _passwordVisible ? false : true,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                    child: Icon(
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(AppSize.inset),
                child: CustomTextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                        'You have successfully change the password',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context).primaryColorLight),
                      )));
                    },
                    title: 'Change Password',
                    buttonType: ButtonType.round),
              ),
            ],
          )),
    );
  }
}
