import 'package:flutter/widgets.dart';

class WidgetStyle {
  static double screenHorizontal = 16;
  static double screenVertical = 16;

  static double appBarElevation = 2;
  static double floatingActionButtonElevation = 6;
  static double cardElevation = 4;
  static double sheetElevation = 4;

  static double defaultDotSize = 16;
  static double defaultIconSize = 32;
  static double controllerIconHeight = 48;
  static double eapIconWidth = 72;

  static double cardRadius = 16;
  static double textFieldRadius = 12;
  static double bottomSheetRadius = 16;
  static double circleRadius = 256;

  static double pickerSheetHeight = 200;
  static double pickerHeight = 130;
  static double pickerSqueeze = 1.2;
  static double pickerMagnification = 1.3;
  static double pickerItemExtent = 32;

  static double dropdownButtonMenuMaxHeight = .8;

  static EdgeInsets screenPadding = EdgeInsets.symmetric(horizontal: screenHorizontal, vertical: screenVertical);
  static EdgeInsets screenHorizontalPadding = EdgeInsets.symmetric(horizontal: screenHorizontal);
  static EdgeInsets screenVerticalPadding = EdgeInsets.symmetric(vertical: screenVertical);

  static EdgeInsets listviewVerticalPadding = EdgeInsets.symmetric(vertical: screenVertical);

  static EdgeInsets sheetPadding = screenPadding;

  static EdgeInsets buttonPadding = const EdgeInsets.all(8);
  static EdgeInsets cardMargin = const EdgeInsets.all(8);
  static EdgeInsets cardPadding = const EdgeInsets.all(12);
  static EdgeInsets titlePadding = const EdgeInsets.symmetric(vertical: 4, horizontal: 8);
}
