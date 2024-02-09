import 'dart:math';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/src/features/home/domain/entity/music_entity.dart';
import 'package:spotify/src/features/home/presentation/bloc/music_bloc/music_bloc.dart';
import 'package:spotify/src/features/home/presentation/widget/playlist_icon_set.dart';
import 'package:spotify/src/features/home/presentation/widget/playlist_music.dart';
import 'package:spotify/src/utils/extension/mediaquery_extension.dart';

@RoutePage()
class PlayListView extends StatefulWidget {
  final int id;
  const PlayListView({
    super.key,
    required this.id,
  });

  @override
  State<PlayListView> createState() => _PlayListViewState();
}

class _PlayListViewState extends State<PlayListView> {
  @override
  void initState() {
    BlocProvider.of<MusicBloc>(context).add(
      GetMusicEvent(widget.id),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: SizedBox(height: 30),
            ),
            SliverPersistentHeader(
              delegate: ResizableImageHeaderDelegate(
                context: context,
                maxHeight: context.dynamicHeight(0.27), // Maximum height
              ),
              pinned: false,
              floating: true,
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 22),
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    Container(
                      color: Colors.blueGrey,
                      width: context.mediaQueryWidth,
                      height: context.dynamicHeight(0.09),
                    ),
                    const SizedBox(height: 15),
                    const PlayListIconSet(),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
            BlocBuilder<MusicBloc, MusicState>(
              builder: (context, state) {
                print("state: $state");
                return SliverList.separated(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: PlayListMusic(
                        id: index,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  itemCount: state.musics?.length ?? 0,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class ResizableImageHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double maxHeight;
  final BuildContext context;

  ResizableImageHeaderDelegate({
    required this.maxHeight,
    required this.context,
  });

  @override
  double get minExtent => 0;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // Calculate the size reduction based on the scroll offset
    double currentExtent = max(maxExtent - shrinkOffset, minExtent);
    double screenWidth = MediaQuery.of(context).size.width;
    double currentWidth = (currentExtent / maxExtent) * screenWidth;
    double currentHeight = (currentExtent / maxExtent) * maxHeight;

    return SizedBox(
      height: currentHeight,
      width: currentWidth,
      child: Center(
        child: Container(
          color: Colors.blueGrey,
          width: currentWidth,
          height: currentHeight,
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant ResizableImageHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight || context != oldDelegate.context;
  }
}
