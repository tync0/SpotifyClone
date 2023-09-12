import 'package:flutter/material.dart';
import 'package:spotify/src/utils/contants/colors.dart';

abstract class AppTheme {
  static ThemeData get appTheme {
    return ThemeData(
      scaffoldBackgroundColor: AppColor.scaffoldColor,
      useMaterial3: false,
    );
  }
}
