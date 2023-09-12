import 'package:flutter/material.dart';
import 'package:spotify/src/utils/extension/mediaquery_extension.dart';

class MusicViewImage extends StatelessWidget {
  const MusicViewImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.dynamicHeight(0.37),
      width: context.dynamicWidth(0.8),
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
