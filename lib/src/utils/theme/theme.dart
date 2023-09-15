import 'package:flutter/material.dart';
import 'package:newfocus_v2/src/utils/theme/widget_themes/icons_theme.dart';
import 'package:newfocus_v2/src/utils/theme/widget_themes/text_theme.dart';

class TAppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: TTextTheme.lightTextTheme,
    scaffoldBackgroundColor: const Color.fromARGB(255, 250, 238, 255),
    fontFamily: 'Poppins',
    iconTheme: IconThemeData(
      color: iconColors.lightIconColor,
    ),
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: TTextTheme.darkTextTheme,
    scaffoldBackgroundColor: const Color.fromRGBO(28, 28, 31, 1),
    fontFamily: 'Poppins',
    iconTheme: IconThemeData(
      color: iconColors.darkIconColor,
    ),
  );

  static final IconColors iconColors = IconColors(
    lightIconColor: Color.fromARGB(255, 0, 0, 0),
    darkIconColor: Color.fromARGB(255, 255, 255, 255),
  );
}
