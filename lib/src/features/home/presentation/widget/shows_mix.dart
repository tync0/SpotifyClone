import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:spotify/src/utils/contants/text_style.dart';
import 'package:spotify/src/utils/extension/mediaquery_extension.dart';

class ShowsMix extends StatelessWidget {
  const ShowsMix({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.dynamicWidth(0.4),
      height: context.dynamicHeight(0.25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () async {
              context.router.pushNamed('/playlist');
            },
            child: Container(
              width: context.dynamicWidth(0.4),
              height: context.dynamicHeight(0.19),
              color: Colors.blueGrey,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Text(
              'Şehinşah, Ati242, Patron and more',
              style: ConstantTextStyle.smallTextStyle!.copyWith(
                color: Colors.grey[500],
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
