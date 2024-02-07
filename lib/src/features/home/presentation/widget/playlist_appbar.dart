import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class PlayListAppBar extends StatefulWidget {
  const PlayListAppBar({super.key});

  @override
  State<PlayListAppBar> createState() => _PlayListAppBarState();
}

class _PlayListAppBarState extends State<PlayListAppBar> {
  bool tapped = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => context.router.pop(),
          onTapDown: (details) {
            setState(() {
              tapped = true;
            });
          },
          onTapUp: (_) {
            // When the button is released
            setState(() {
              tapped = false;
            });
          },
          onTapCancel: () {
            // When the user's tap is canceled (e.g., user swipes away)
            setState(() {
              tapped = false;
            });
          },
          child: Icon(
            Icons.arrow_back,
            color: tapped ? Colors.grey : Colors.white,
            size: 30,
          ),
        ),
        const SizedBox(width: 34),
      ],
    );
  }
}
