import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:spotify/src/features/home/presentation/widget/playlist_icon_set.dart';
import 'package:spotify/src/features/home/presentation/widget/playlist_music.dart';
import 'package:spotify/src/utils/extension/mediaquery_extension.dart';

import '../widget/playlist_appbar.dart';

@RoutePage()
class PlayListView extends StatefulWidget {
  const PlayListView({super.key});

  @override
  State<PlayListView> createState() => _PlayListViewState();
}

class _PlayListViewState extends State<PlayListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            right: 18,
            left: 18,
            top: 22,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const PlayListAppBar(),
                const SizedBox(height: 15),
                Container(
                  color: Colors.blueGrey,
                  width: context.mediaQueryWidth,
                  height: context.dynamicHeight(0.09),
                ),
                const SizedBox(height: 15),
                const PlayListIconSet(),
                const SizedBox(height: 15),
                SizedBox(
                  width: context.mediaQueryHeight,
                  height: context.dynamicHeight(0.09) * 6,
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return const PlayListMusic();
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
