import 'package:flutter/material.dart';
import 'package:spotify/src/utils/contants/colors.dart';

import '../../../../utils/contants/text_style.dart';

class HomeTag extends StatelessWidget {
  final String title;
  const HomeTag({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: AppColor.modelColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Text(
        title,
        style: ConstantTextStyle.smallTextStyle,
      ),
    );
  }
}
