import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final IconData iconData;
  final Color? color;
  final double? size;
  const CustomIcon({
    super.key,
    required this.iconData,
    this.color = Colors.white,
    this.size = 30,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData,
      color: color,
      size: size,
    );
  }
}
