import 'package:flutter/material.dart';
import 'package:wall_e/core/color/theme_color.dart';
import 'package:wall_e/core/theme/theme_data.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {this.textInputType,
      this.textController,
      this.errorMessage,
      this.helperMessage,
      this.labelText,
      this.hintText,
      this.maxLines,
      this.isObscure,
      this.onPressed,
      this.readOnly,
      this.maxLength,
      this.trailingIcon,
      this.leadingIcon,
      this.enabled,
      this.onChanged,
      this.onSaved,
      this.validator,
      this.filled,
      this.onFieldSubmitted,
      this.fillColor,
      this.prefixIcon,
      this.suffixIcon,
      Key? key})
      : super(key: key);
  final TextInputType? textInputType;
  final TextEditingController? textController;
  final String? errorMessage, helperMessage;
  final String? labelText;
  final String? hintText;
  final bool? isObscure;
  final bool? readOnly;
  final GestureTapCallback? onPressed;
  final int? maxLength;
  final int? maxLines;
  final IconData? trailingIcon;
  final IconData? leadingIcon;
  final bool? enabled;
  final FormFieldSetter? onChanged;
  final FormFieldSetter? onSaved;
  final FormFieldSetter? onFieldSubmitted;
  final FormFieldValidator? validator;
  final bool? filled;
  final Colors? fillColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  var isSecureNow = true;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return TextFormField(
      enabled: widget.enabled ?? true,
      cursorColor: ThemeAppColors.primaryBlue,
      keyboardType: widget.textInputType,
      style: theme.textTheme.bodyMedium,
      controller: widget.textController,
      maxLength: widget.maxLength,
      maxLines: widget.maxLines ?? 1,
      validator: widget.validator,
      onChanged: widget.onChanged,
      onSaved: widget.onSaved,
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration: InputDecoration(
          filled: widget.filled ?? true,
          fillColor: theme.backgroundColor,
          counter: const Offstage(),
          labelText: widget.labelText,
          hintText: widget.hintText,
          helperText: widget.helperMessage,
          errorText: widget.errorMessage,
          helperStyle: theme.textTheme.bodySmall,
          labelStyle: Theme.of(context).textTheme.placeHolder(context),
          prefixIcon: (widget.prefixIcon != null)
              ? widget.prefixIcon
              : widget.leadingIcon != null
                  ? Icon(
                      widget.leadingIcon,
                      color: ThemeAppColors.grey,
                    )
                  : null,
          contentPadding:
              (widget.prefixIcon != null || widget.leadingIcon != null)
                  ? const EdgeInsets.only(top: 16, bottom: 16)
                  : const EdgeInsets.all(16), //size of textfield
          errorStyle: theme.textTheme.bodySmall?.copyWith(color: ThemeAppColors.red),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1.0, color: ThemeAppColors.grey),
            borderRadius: BorderRadius.circular(8.0),
          ),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1.0, color: ThemeAppColors.grey),
              borderRadius: BorderRadius.circular(8.0)),
          border: OutlineInputBorder(
            borderSide: const BorderSide(width: 8.0),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: theme.primaryColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8.0)),
          suffixIcon: (widget.suffixIcon != null)
              ? widget.suffixIcon
              : widget.isObscure ?? false
                  ? IconButton(
                      icon: Icon(
                          isSecureNow ? Icons.visibility : Icons.visibility_off,
                          color: ThemeAppColors.primaryBlue),
                      onPressed: () {
                        setState(() {
                          isSecureNow = !isSecureNow;
                        });
                      })
                  : widget.trailingIcon != null
                      ? Icon(
                          widget.trailingIcon,
                          color: ThemeAppColors.grey,
                        )
                      : null),
      obscureText: (widget.isObscure ?? false) ? isSecureNow : false,
    );
  }
}
