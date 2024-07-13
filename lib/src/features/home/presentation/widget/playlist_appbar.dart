import 'package:flutter/material.dart';
import 'package:spotify/src/utils/contants/colors.dart';

class PlayListAppBar extends StatefulWidget {
  final String imageUrl, playlistName;
  const PlayListAppBar({
    super.key,
    required this.imageUrl,
    required this.playlistName,
  });

  @override
  State<PlayListAppBar> createState() => _PlayListAppBarState();
}

class _PlayListAppBarState extends State<PlayListAppBar> {
  bool tapped = false;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 240,
      backgroundColor: AppColor.scaffoldColor,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          double percent = ((constraints.maxHeight - kToolbarHeight) /
                  (200.0 - kToolbarHeight))
              .clamp(0.0, 1.0);
          return DecoratedBox(
            decoration: const BoxDecoration(),
            child: Stack(
              children: [
                Center(
                  child: SizedBox(
                    height: 100 + (100 * percent),
                    width: 100 + (100 * percent),
                    child: Opacity(
                      opacity: percent,
                      child: Image.network(
                        widget.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                if (percent == 0)
                  Center(
                    child: Text(
                      widget.playlistName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0 + (10 * percent),
                      ),
                    ),
                  )
              ],
            ),
          );
        },
      ),
      pinned: true,
    );
  }
}
