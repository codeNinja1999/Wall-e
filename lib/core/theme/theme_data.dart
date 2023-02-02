import 'package:flutter/material.dart';
import 'package:wall_e/core/color/theme_color.dart';

final ThemeData lightTheme = _buildLightTheme();

ThemeData _buildLightTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    brightness: Brightness.light,
    primaryColor: ThemeAppColors.primaryBlue,
    bottomAppBarColor: ThemeAppColors.light,
    primaryColorLight: ThemeAppColors.light,
    backgroundColor: ThemeAppColors.background,
    disabledColor: ThemeAppColors.grey,
    errorColor: ThemeAppColors.red,
    primaryColorDark: ThemeAppColors.primaryDark,
    scaffoldBackgroundColor: ThemeAppColors.background,
    canvasColor: Colors.transparent,
    selectedRowColor: ThemeAppColors.grey,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: ThemeAppColors.light,
      backgroundColor: ThemeAppColors.primaryBlue,
    ),
    primaryIconTheme: IconThemeData(color: ThemeAppColors.black),
    iconTheme: const IconThemeData(
      color: Color.fromRGBO(0, 0, 0, 1), //change your color here
    ),
    dialogBackgroundColor: ThemeAppColors.background,
    buttonTheme: ButtonThemeData(
      buttonColor: ThemeAppColors.light,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ThemeAppColors.primaryBlue,
      selectionColor: ThemeAppColors.skyBlue,
      selectionHandleColor: ThemeAppColors.skyBlue,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
        ),
        padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.fromLTRB(12, 12, 12, 12)),
        foregroundColor:
            MaterialStateProperty.all<Color>(ThemeAppColors.background!),
        backgroundColor:
            MaterialStateProperty.all<Color>(ThemeAppColors.primaryBlue),
      ),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
          color: ThemeAppColors.black,
          fontSize: 22),
      titleMedium: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          color: ThemeAppColors.black,
          fontSize: 16),
      titleSmall: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          color: ThemeAppColors.black,
          fontSize: 14),
      labelLarge: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          color: ThemeAppColors.black,
          fontSize: 14),
      labelMedium: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          color: ThemeAppColors.black,
          fontSize: 12),
      labelSmall: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          color: ThemeAppColors.black,
          fontSize: 11),
      bodyLarge: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.normal,
          color: ThemeAppColors.black,
          fontSize: 16),
      bodyMedium: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.normal,
          color: ThemeAppColors.black,
          fontSize: 14),
      bodySmall: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.normal,
          color: ThemeAppColors.black,
          fontSize: 12),
    ),
  );
}

final ThemeData darkTheme = _builddarkTheme();

ThemeData _builddarkTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    brightness: Brightness.dark,
    primaryColor: ThemeAppColors.primaryBlue,
    bottomAppBarColor: ThemeAppColors.secondary,
    primaryColorLight: ThemeAppColors.grey,
    primaryColorDark: ThemeAppColors.light,
    canvasColor: Colors.transparent,
    disabledColor: ThemeAppColors.grey,
    errorColor: ThemeAppColors.red,
    backgroundColor: ThemeAppColors.primaryDark,
    selectedRowColor: ThemeAppColors.grey,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: ThemeAppColors.light,
      backgroundColor: ThemeAppColors.primaryBlue,
    ),
    primaryIconTheme: IconThemeData(color: ThemeAppColors.black),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateColor.resolveWith(
        (states) {
          if (states.contains(MaterialState.selected)) {
            return ThemeAppColors
                .primaryBlue; // the color when checkbox is selected;
          }
          return ThemeAppColors.light; //the color when checkbox is unselected;
        },
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ThemeAppColors.primaryBlue,
      selectionColor: ThemeAppColors.skyBlue,
      selectionHandleColor: ThemeAppColors.skyBlue,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: ThemeAppColors.light,
    ),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
      textStyle: MaterialStateProperty.all<TextStyle>(
        const TextStyle(
          fontWeight: FontWeight.w500,
          fontFamily: 'Poppins',
          fontSize: 14,
        ),
      ),
      padding: MaterialStateProperty.all<EdgeInsets>(
          const EdgeInsets.fromLTRB(12, 12, 12, 12)),
      foregroundColor:
          MaterialStateProperty.all<Color>(ThemeAppColors.background!),
      backgroundColor:
          MaterialStateProperty.all<Color>(ThemeAppColors.primaryBlue),
    )),
    textTheme: TextTheme(
      titleLarge: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          color: ThemeAppColors.white,
          fontSize: 22),
      titleMedium: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          color: ThemeAppColors.white,
          fontSize: 17),
      titleSmall: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          color: ThemeAppColors.white,
          fontSize: 14),
      labelLarge: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          color: ThemeAppColors.white,
          fontSize: 14),
      labelMedium: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          color: ThemeAppColors.white,
          fontSize: 12),
      labelSmall: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          color: ThemeAppColors.white,
          fontSize: 11),
      bodyLarge: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.normal,
          color: ThemeAppColors.white,
          fontSize: 16),
      bodyMedium: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.normal,
          color: ThemeAppColors.white,
          fontSize: 14),
      bodySmall: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.normal,
          color: ThemeAppColors.white,
          fontSize: 12),
    ),
  );
}

extension CustomStyles on TextTheme {
  get error => (BuildContext context) => TextStyle(
        fontSize: 14.0,
        color: Theme.of(context).errorColor,
        fontWeight: FontWeight.normal,
      );

  get placeHolder => (BuildContext context) => TextStyle(
        fontSize: 12.0,
        fontFamily: "Poppins",
        color: (Theme.of(context).brightness == Brightness.dark)
            ? Colors.white
            : ThemeAppColors.grey,
        fontWeight: FontWeight.normal,
      );
}
