import 'package:flutter/material.dart';
import 'package:spotify/src/shared/widget/custom_icon.dart';
import 'package:spotify/src/utils/contants/svg_const.dart';
import 'package:spotify/src/utils/contants/text_style.dart';
import 'package:spotify/src/utils/extension/mediaquery_extension.dart';

import '../../../../shared/widget/svg_picture.dart';

class MusicViewTitle extends StatelessWidget {
  const MusicViewTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: context.dynamicHeight(0.08),
      width: context.mediaQueryWidth,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text(
                'Kaybettik',
                style: ConstantTextStyle.largeTextStyle!.copyWith(fontSize: 22),
              ),
              const SizedBox(height: 10),
              Text(
                'Lia Shine',
                style: ConstantTextStyle.smallTextStyle,
              ),
            ],
          ),
          Spacer(),
          SvgPic(
            assetsName: SvgConst.hideSong,
            size: 26,
          ),
          SizedBox(width: 35),
          CustomIcon(
            iconData: Icons.favorite_border,
          ),
        ],
      ),
    );
  }
}
