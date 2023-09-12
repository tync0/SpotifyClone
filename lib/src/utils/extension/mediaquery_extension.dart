import 'package:flutter/material.dart';

extension MediaQueryExtension on BuildContext {
  double get mediaQueryHeight => MediaQuery.sizeOf(this).height;
  double get mediaQueryWidth => MediaQuery.sizeOf(this).width;
  double dynamicHeight(double value) => mediaQueryHeight * value;
  double dynamicWidth(double value) => mediaQueryWidth * value;
}
