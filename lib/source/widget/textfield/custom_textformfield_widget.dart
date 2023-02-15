import 'package:flutter/material.dart';
import 'package:wall_e/core/app_size/app_size.dart';
import 'package:wall_e/core/color/theme_color.dart';
import 'package:wall_e/core/icons/app_icons.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.textController,
    this.hintText,
    this.isObscure,
    this.validator,
    this.filled,
    this.suffixIcon,
    this.prefixIcon,
    this.fillColor,
    this.textInputAction,
    this.keyboardType,
    this.onSaved,
    this.enabled,
    this.labelText,
    this.labelStyle,
    this.trailingIcon,
    this.leadingIcon,
    this.readOnly,
    this.onPressed,
    this.maxLength,
    this.maxLines,
    this.onChanged,
    this.onFieldSubmitted,
    this.errorMessage,
    this.helperMessage,
  });

  final bool? enabled;
  final TextEditingController? textController;
  final String? hintText;
  final String? Function(String?)? validator;
  final bool? isObscure;
  final Widget? suffixIcon;
  final bool? filled;
  final Widget? prefixIcon;
  final Color? fillColor;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final Function(String?)? onSaved;
  final String? labelText;
  final TextStyle? labelStyle;
  final IconData? trailingIcon;
  final IconData? leadingIcon;

  final bool? readOnly;
  final GestureTapCallback? onPressed;
  final int? maxLength;
  final int? maxLines;
  final FormFieldSetter? onChanged;
  final FormFieldSetter? onFieldSubmitted;
  final String? errorMessage, helperMessage;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  var isSecureNow = true;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return TextFormField(
      autofocus: false,
      obscuringCharacter: '*',
      controller: widget.textController,
      validator: widget.validator,
      enabled: widget.enabled ?? true,
      obscureText: (widget.isObscure ?? false) ? isSecureNow : false,
      textInputAction: widget.textInputAction,
      cursorColor: theme.primaryColor,
      style: theme.textTheme.bodyMedium,
      keyboardType: widget.keyboardType,
      maxLength: widget.maxLength,
      maxLines: widget.maxLines ?? 1,
      onChanged: widget.onChanged,
      onSaved: widget.onSaved,
      decoration: InputDecoration(
        filled: widget.filled ?? true,
        fillColor: theme.primaryColorLight,
        labelText: widget.labelText,
        labelStyle: widget.labelStyle,
        helperText: widget.helperMessage,
        helperStyle: theme.textTheme.bodySmall,
        errorText: widget.errorMessage,
        errorStyle:
            theme.textTheme.bodySmall?.copyWith(color: ThemeAppColors.red),
        hintText: widget.hintText,
        contentPadding:
            (widget.prefixIcon != null || widget.leadingIcon != null)
                ? const EdgeInsets.symmetric(vertical: AppSize.inset)
                : const EdgeInsets.symmetric(horizontal: AppSize.inset),
        hintStyle: Theme.of(context)
            .textTheme
            .labelLarge
            ?.copyWith(color: ThemeAppColors.greyShade),
        prefixIcon: (widget.prefixIcon != null)
            ? widget.prefixIcon
            : widget.leadingIcon != null
                ? Icon(widget.leadingIcon, color: ThemeAppColors.grey)
                : null,
        suffixIcon: (widget.suffixIcon != null)
            ? widget.suffixIcon
            : widget.isObscure ?? false
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isSecureNow = !isSecureNow;
                      });
                    },
                    icon: Icon(
                        isSecureNow
                            ? AppIcon.visibilityOff
                            : AppIcon.visibility,
                        color: ThemeAppColors.primaryBlue),
                  )
                : widget.trailingIcon != null
                    ? Icon(widget.trailingIcon, color: ThemeAppColors.grey)
                    : null,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.primaryColor),
          borderRadius: BorderRadius.circular(AppSize.cornerRadiusMedium),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.primaryColor),
          borderRadius: BorderRadius.circular(AppSize.cornerRadiusMedium),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: theme.primaryColor),
          borderRadius: BorderRadius.circular(AppSize.cornerRadiusMedium),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1.0, color: theme.primaryColor),
          borderRadius: BorderRadius.circular(AppSize.cornerRadiusMedium),
        ),
      ),
    );
  }
}
