import 'package:flutter/material.dart';

class AppTheme{
  static const MaterialColor materialColor = MaterialColor(
      0xff276E59,
      <int, Color>{
        50: Color(0xffe5eeeb),
        100: Color(0xffbed4cd),
        200: Color(0xff93b7ac),
        300: Color(0xff689a8b),
        400: Color(0xff478472),
        500: Color(0xff276e59),
        600: Color(0xff236651),
        700: Color(0xff1d5b48),
        800: Color(0xff17513e),
      }
  );
  static ThemeData applicationTheme(){
    return ThemeData(
      fontFamily: "SF-Pro",
      textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.black,
          selectionColor: Colors.black,
          selectionHandleColor: Colors.black
      ), colorScheme: ColorScheme.fromSwatch(primarySwatch: materialColor).copyWith(error: Colors.red),
    );
  }

}