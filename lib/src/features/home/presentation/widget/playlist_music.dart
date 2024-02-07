import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:spotify/src/utils/extension/mediaquery_extension.dart';

import '../../../../shared/widget/custom_icon.dart';
import '../../../../utils/contants/text_style.dart';

class PlayListMusic extends StatelessWidget {
  const PlayListMusic({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        context.router.pushNamed('/music');
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: context.dynamicWidth(0.15),
            height: context.dynamicHeight(0.071),
            color: Colors.blueGrey,
          ),
          const SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.only(top: 7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Donmedin ki',
                  style: ConstantTextStyle.mediumTextStyle,
                ),
                const SizedBox(height: 5),
                Text(
                  'Sehinsah',
                  style: ConstantTextStyle.smallTextStyle!.copyWith(
                    color: Colors.grey[400],
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.only(top: 11),
            child: CustomIcon(iconData: Icons.more_vert),
          ),
        ],
      ),
    );
  }
}
