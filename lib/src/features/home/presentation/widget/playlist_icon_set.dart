import 'package:flutter/material.dart';
import 'package:spotify/src/shared/widget/custom_icon.dart';
import 'package:spotify/src/utils/contants/colors.dart';

class PlayListIconSet extends StatelessWidget {
  const PlayListIconSet({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomIcon(
          iconData: Icons.favorite_border,
        ),
        const SizedBox(width: 18),
        CustomIcon(
          iconData: Icons.download_for_offline_outlined,
          color: AppColor.greyIconColor,
        ),
        const SizedBox(width: 18),
        CustomIcon(
          iconData: Icons.more_vert,
          color: AppColor.greyIconColor,
        ),
        const Spacer(),
        CustomIcon(
          iconData: Icons.share,
          color: AppColor.greyIconColor,
        ),
        const SizedBox(width: 10),
        Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColor.primaryColor,
          ),
          child: const CustomIcon(
            iconData: Icons.play_arrow,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
