import 'package:flutter/material.dart';

class MyTheme {
  static Map<ThemeMode, ThemeData> appThemes = {
    ThemeMode.light: ThemeData(
      colorScheme: ColorScheme(
        primary: LightColors.blue,
        primaryVariant: LightColors.blue,
        secondary: LightColors.grey,
        secondaryVariant: LightColors.grey,
        surface: LightColors.white,
        background: LightColors.grey,
        error: LightColors.red,
        onPrimary: LightColors.white,
        onSecondary: LightColors.blue,
        onSurface: LightColors.blue,
        onBackground: LightColors.blue,
        onError: LightColors.red,
        brightness: Brightness.light,
      ),
      backgroundColor: LightColors.white,
      bottomAppBarColor:
          const Color(0xFF2A7A3A), //Incoming transaction: amount color
      cardColor: LightColors.white,
      dialogBackgroundColor: LightColors.white,
      disabledColor: LightColors.lightBlue,
      errorColor: LightColors.red,
      focusColor: LightColors.blue,
      hintColor: LightColors.grey,
      primaryColor: LightColors.blue,
      primarySwatch: materialColor(LightColors.grey),
      shadowColor: LightColors.lightBlue,
      unselectedWidgetColor: LightColors.grey,

      textTheme: TextTheme(
        button: TextStyle(
            letterSpacing: 1.4, fontSize: 16, color: DarkColors.white),
      ),

      dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(
          //to set border radius to button
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      cardTheme: CardTheme(
        elevation: 2,
        color: LightColors.white,
        margin: const EdgeInsets.fromLTRB(24, 0, 24, 12),
        shape: RoundedRectangleBorder(
          //to set border radius to button
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: LightColors.blue,
          onPrimary: LightColors.blue,
          textStyle: TextStyle(color: LightColors.white,)
        ),
      ),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: LightColors.blue,
          )
      ),
    ),
    ThemeMode.dark: ThemeData.dark().copyWith(
      colorScheme: ColorScheme(
        primary: DarkColors.blue,
        primaryVariant: DarkColors.blue,
        secondary: DarkColors.white,
        secondaryVariant: DarkColors.white,
        surface: DarkColors.black,
        background: DarkColors.blue,
        error: DarkColors.red,
        onPrimary: DarkColors.blue,
        onSecondary: DarkColors.blue,
        onSurface: DarkColors.white,
        onBackground: DarkColors.blue,
        onError: DarkColors.red,
        brightness: Brightness.dark,
      ),
      backgroundColor: DarkColors.blue,
      bottomAppBarColor: DarkColors.darkBlue, //Incoming transaction: amount color
      cardColor: DarkColors.blue,
      dialogBackgroundColor: DarkColors.blue,
      disabledColor: DarkColors.darkBlue,
      errorColor: DarkColors.red,
      focusColor: DarkColors.black,
      hintColor: DarkColors.white,
      primaryColor: DarkColors.black,
      scaffoldBackgroundColor: DarkColors.blue,
      shadowColor: DarkColors.darkBlue,
      unselectedWidgetColor: DarkColors.grey,

      textTheme: TextTheme(
        headline6: TextStyle(color: DarkColors.white),
        headline5: TextStyle(color: DarkColors.white),
        headline4: TextStyle(color: DarkColors.white),
        headline3: TextStyle(color: DarkColors.white),
        headline2: TextStyle(color: DarkColors.white),
        headline1: TextStyle(color: DarkColors.white),
        subtitle1: TextStyle(color: DarkColors.white),
        subtitle2: TextStyle(color: DarkColors.white),
        bodyText1: TextStyle(color: DarkColors.white),
        bodyText2: TextStyle(color: DarkColors.white),
        button: TextStyle(
            letterSpacing: 1.4, fontSize: 16, color: DarkColors.white),
      ),

      dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(
          //to set border radius to button
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      cardTheme: CardTheme(
        elevation: 2,
        color: DarkColors.blue,
        margin: const EdgeInsets.fromLTRB(24, 0, 24, 12),
        shape: RoundedRectangleBorder(
          //to set border radius to button
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: DarkColors.white,
          onPrimary: DarkColors.white,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
        primary: DarkColors.black,
      )),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(color: DarkColors.grey),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: DarkColors.white),
        ),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: DarkColors.white,
      ),
    )
  };

  static ThemeData getTheme(ThemeMode mode) {
    return appThemes[mode] ?? appThemes[ThemeMode.light]!;
  }

  static MaterialColor materialColor(Color color) {
    return MaterialColor(
      color.value,
      <int, Color>{
        50: color,
        100: color,
        200: color,
        300: color,
        400: color,
        500: color,
        600: color,
        700: color,
        800: color,
        900: color,
      },
    );
  }
}

abstract class LightColors {
  static Color get blue => const Color(0xff008FC5);
  static Color get lightBlue => const Color(0xffb2dded);
  static Color get black => const Color(0xFF000000);
  static Color get grey => const Color(0xFF717C89);
  static Color get white => const Color(0xFFFDFFFC);
  static Color get red => const Color(0xFFF8333C);
  static Color get yellow => const Color(0xFFFFBF46);
}

abstract class DarkColors {
  static Color get blue => const Color(0xFF00729d);
  static Color get black => const Color(0xFF0D1821);
  static Color get darkBlue => const Color(0xFF234058);
  static Color get grey => const Color(0xFFE9EAED);
  static Color get white => const Color(0xFFFDFFFC);
  static Color get red => const Color(0xFFA8201A);
}
