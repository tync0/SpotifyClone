import 'package:flutter/material.dart';
import 'package:spotify/src/utils/contants/colors.dart';
import 'package:spotify/src/utils/contants/text_style.dart';
import 'package:spotify/src/utils/extension/mediaquery_extension.dart';

class ListenedMix extends StatelessWidget {
  const ListenedMix({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.modelColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(5),
              bottomLeft: Radius.circular(5),
            ),
            child: Container(
              color: Colors.blue,
              width: context.dynamicWidth(0.15),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            '2010\'s Mix',
            style: ConstantTextStyle.smallTextStyle,
          ),
        ],
      ),
    );
  }
}
