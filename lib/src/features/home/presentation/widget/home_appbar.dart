import 'package:flutter/material.dart';
import '../../../../shared/widget/svg_picture.dart';
import '../../../../utils/contants/svg_const.dart';
import '../../../../utils/contants/text_style.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Good evening',
          style: ConstantTextStyle.largeTextStyle,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.notifications_none,
              color: Colors.white,
              size: 30,
            ),
            SizedBox(width: 20),
            SvgPic(assetsName: SvgConst.time),
            SizedBox(width: 20),
            SvgPic(assetsName: SvgConst.settings, size: 28),
          ],
        ),
      ],
    );
  }
}
