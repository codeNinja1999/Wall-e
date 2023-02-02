import 'package:flutter/material.dart';

class TextFormFieldPasswordWidget extends StatelessWidget {
  const TextFormFieldPasswordWidget(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText,
      this.validator, this.showPassword});

  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Widget? showPassword;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
        autofocus: false,
        obscuringCharacter: '*',
        controller: controller,
        obscureText: obscureText,
        textInputAction: TextInputAction.next,
        cursorColor: theme.primaryColor,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          suffixIcon: showPassword,
          filled: true,
          fillColor: theme.primaryColorLight,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 14, color: Colors.grey.shade400),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        validator: validator);
  }
}
