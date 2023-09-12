import 'package:flutter/material.dart';

abstract class ConstantTextStyle {
  static TextStyle? get largeTextStyle => const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      );
  static TextStyle? get mediumTextStyle => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      );
  static TextStyle? get smallTextStyle => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      );
}
