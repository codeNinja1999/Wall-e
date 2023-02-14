import 'package:flutter/material.dart';
import 'package:wall_e/core/color/theme_color.dart';
import 'package:wall_e/core/icons/app_icons.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  MyAppBar({
    this.title,
    this.onPressed,
    this.leadingIcon,
    Key? key,
    this.trailingIcon,
    this.backgroundColor,
    this.titleStyle,
  }) : super(key: key);
  final String? title;
  final Function()? onPressed;
  final bool? leadingIcon;
  final bool? trailingIcon;
  final Color? backgroundColor;
  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      backgroundColor: backgroundColor ?? theme.primaryColor,
      centerTitle: true,
      leading: Visibility(
        visible: leadingIcon ?? false,
        child: IconButton(
          icon: const Icon(
            AppIcon.arrowBack,
          ),
          onPressed: onPressed,
          color: ThemeAppColors.light,
        ),
      ),
      title: Text(
        title ?? "",
        style: titleStyle ?? Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(color: ThemeAppColors.light),
      ),
      actions: [
        Visibility(
          visible: trailingIcon ?? false,
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Just a message Download pdf..'),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
              child: SizedBox(
                  height: 25,
                  width: 35,
                  child:
                      Image.asset('assets/images/icon/pdf_download_icon.png')),
            ),
          ),
        ),
      ],
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
