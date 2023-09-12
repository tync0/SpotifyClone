import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:spotify/src/shared/widget/custom_icon.dart';
import 'package:spotify/src/utils/contants/text_style.dart';

class MusicAppBar extends StatelessWidget {
  const MusicAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () => context.router.pop(),
          child: const CustomIcon(
            iconData: Icons.keyboard_arrow_down,
            size: 40,
          ),
        ),
        Column(
          children: [
            Text(
              'PLAYING FROM PLAYLIST',
              style: ConstantTextStyle.smallTextStyle!.copyWith(
                color: Colors.grey[400],
                fontSize: 12,
              ),
            ),
            Text(
              '2010\'s Mix',
              style: ConstantTextStyle.mediumTextStyle!.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        const CustomIcon(iconData: Icons.more_vert),
      ],
    );
  }
}
