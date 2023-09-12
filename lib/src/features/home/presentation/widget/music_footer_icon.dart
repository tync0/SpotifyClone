import 'package:flutter/material.dart';

import '../../../../shared/widget/custom_icon.dart';
import '../../../../shared/widget/svg_picture.dart';
import '../../../../utils/contants/svg_const.dart';

class MusicFooterIconSet extends StatelessWidget {
  const MusicFooterIconSet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPic(
            assetsName: SvgConst.connnectDevice,
            size: 24,
          ),
          CustomIcon(
            iconData: Icons.share,
            size: 24,
          ),
        ],
      ),
    );
  }
}
