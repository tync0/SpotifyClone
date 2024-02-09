import 'package:flutter/material.dart';
import 'package:spotify/src/shared/widget/custom_icon.dart';
import 'package:spotify/src/utils/contants/svg_const.dart';
import 'package:spotify/src/utils/contants/text_style.dart';
import 'package:spotify/src/utils/extension/mediaquery_extension.dart';

import '../../../../shared/widget/svg_picture.dart';

class MusicViewTitle extends StatelessWidget {
  final String musicName;
  const MusicViewTitle({
    super.key,
    required this.musicName,
  });

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
                musicName,
                style: ConstantTextStyle.largeTextStyle!.copyWith(fontSize: 22),
              ),
              const SizedBox(height: 5),
              Text(
                'Skryptonite',
                style: ConstantTextStyle.smallTextStyle!.copyWith(
                  color: Colors.grey[300],
                ),
              ),
            ],
          ),
          const Spacer(),
          const SvgPic(
            assetsName: SvgConst.hideSong,
            size: 28,
          ),
          const SizedBox(width: 35),
          const CustomIcon(
            iconData: Icons.favorite_border,
            size: 32,
          ),
        ],
      ),
    );
  }
}
