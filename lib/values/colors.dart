import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class AppColor {
  static const int primaryColor = 0xFF009FFF;
  static const MaterialColor PRIMARY_SWATCH = MaterialColor(primaryColor, {
    50: Color(primaryColor),
    100: Color(primaryColor),
    200: Color(primaryColor),
    300: Color(primaryColor),
    400: Color(primaryColor),
    500: Color(primaryColor),
    600: Color(primaryColor),
    700: Color(primaryColor),
    800: Color(primaryColor),
    900: Color(primaryColor),
  });

  static const Color WHITE = Color(0xFFFFFFFF);
  static const Color BLACK = Color(0xFF000000);
  static const Color CLEAR = Color(0x00000000);

  static const Color TEXT_HINT_COLOR = Color(0xFF8AD3FF);
  static const Color SPLASH_RIPPLE_COLOR = Color(0xFF009FFF);
  static const Color ICON = Color(0xFF767676);
  static const Color RED = Color(0xFFFF6D6D);

}

Color getColorFromHex(String hexColor) {
  throwIf(hexColor == null, "Invalid color");

  hexColor = hexColor.toUpperCase().replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF" + hexColor;
  }
  return Color(int.parse(hexColor, radix: 16));
}

String getHexFromColor(Color color) {
  throwIf(color == null, "Invalid color");

  return '#${color.value.toRadixString(16)}';
}