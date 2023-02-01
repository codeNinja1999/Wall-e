import 'package:flutter/material.dart';
import 'package:wall_e/core/color/theme_color.dart';

enum ButtonType { primary, plain, bordered, round }

class CustomButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  final String title;
  final Color backgroundColor;
  final IconData? trailingIcon;
  final IconData? leadingIcon;
  final Widget? child;
  final ButtonType buttonType;
  final bool isEnabled;

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.title,
    this.backgroundColor = Colors.transparent,
    this.trailingIcon,
    this.leadingIcon,
    this.child,
    required this.buttonType,
    this.isEnabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextButton(
      style: buttonStyle(theme),
      onPressed: isEnabled ? onPressed : null,
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (leadingIcon != null) ...[
              Icon(leadingIcon, color: theme.iconTheme.color),
              const SizedBox(
                width: 10.0,
              ),
              Text(
                title,
                maxLines: 1,
              ),
            ] else if (trailingIcon != null) ...[
              Text(
                title,
                maxLines: 1,
              ),
              const SizedBox(
                width: 50.0,
              ),
              Icon(
                trailingIcon,
                color: Colors.white,
              ),
            ] else ...[
              Padding(
                padding: const EdgeInsets.all(2),
                child: Text(
                  title,
                  maxLines: 1,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  ButtonStyle? buttonStyle(ThemeData theme) {
    if (buttonType == ButtonType.plain) {
      return theme.textButtonTheme.style?.copyWith(
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.italic,
            fontFamily: 'open_sans',
            fontSize: 12,
          ),
        ),
        shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
        backgroundColor:
            MaterialStateProperty.all<Color>(ThemeAppColors.primaryBlue),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      );
    } else if (buttonType == ButtonType.round) {
      return theme.textButtonTheme.style?.copyWith(
          backgroundColor: MaterialStateProperty.all<Color>(isEnabled
              ? theme.primaryColor
              : theme.primaryColor.withOpacity(0.75)),
          shape: MaterialStateProperty.all<StadiumBorder>(const StadiumBorder(
              side: BorderSide(color: Colors.transparent))));
    } else if (buttonType == ButtonType.bordered) {
      return theme.textButtonTheme.style?.copyWith(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
          side: BorderSide(
              color: isEnabled ? theme.primaryColor : theme.disabledColor),
        ),
      ));
    } else {
      return theme.textButtonTheme.style;
    }
  }
}
