import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/src/features/home/presentation/bloc/music_bloc/music_bloc.dart';
import 'package:spotify/src/features/home/presentation/widget/playlist_icon_set.dart';
import 'package:spotify/src/features/home/presentation/widget/playlist_music.dart';

import 'package:spotify/src/utils/extension/mediaquery_extension.dart';

import '../widget/playlist_appbar.dart';

@RoutePage()
class PlayListView extends StatefulWidget {
  final int id;
  final String imageUrl;
  const PlayListView({
    super.key,
    required this.id,
    required this.imageUrl,
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
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(
              child: SizedBox(height: 5),
            ),
            PlayListAppBar(imageUrl: widget.imageUrl),
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
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: context.mediaQueryHeight,
              ),
            )
          ],
        ),
      ),
    );
  }
}
