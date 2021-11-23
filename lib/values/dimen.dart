
import 'package:flutter/cupertino.dart';

class ScreenPadding {
  static const EdgeInsets edgeInsets = const EdgeInsets.only(
    left: ScreenPadding.HORIZONTAL_NORMAL,
    right: ScreenPadding.HORIZONTAL_NORMAL,
    top: ScreenPadding.CONTENT_TOP,
    bottom: ScreenPadding.CONTENT_LIST_BOTTOM,
  );
  static const double HORIZONTAL_NORMAL = 20.0;
  static const double CONTENT_TOP = 20.0;
  static const double VERTICAL_NORMAL = 20.0;
  static const double CONTENT_LIST_BOTTOM = 200.0;
}

