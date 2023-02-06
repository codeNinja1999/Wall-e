import 'package:flutter/material.dart';
import 'package:wall_e/core/color/theme_color.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    this.textController,
    this.hintText,
    this.obscureText,
    this.validator,
    this.filled,
    this.suffixIcon,
    this.fillColor,
    this.textInputAction,
    this.keyboardType,
    this.cursorColor,
    this.onSaved,
    this.enabled,
    this.labelText,
  });

  bool? enabled;
  TextEditingController? textController;
  String? hintText;
  String? Function(String?)? validator;
  bool? obscureText;
  Widget? suffixIcon;
  bool? filled;
  Color? fillColor;
  TextInputAction? textInputAction;
  TextInputType? keyboardType;
  Color? cursorColor;
  Function(String?)? onSaved;
  String? labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      obscuringCharacter: '*',
      controller: textController,
      validator: validator,
      enabled: enabled,
      obscureText: obscureText ?? false,
      textInputAction: textInputAction,
      cursorColor: cursorColor,
      keyboardType: keyboardType,
      onSaved: onSaved,
      decoration: InputDecoration(
        filled: true,
        suffixIcon: suffixIcon,
        fillColor: Theme.of(context).primaryColorLight,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        labelText: labelText,
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 12, color: ThemeAppColors.greyShade),
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
    );
  }
}
