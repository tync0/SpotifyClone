import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/src/config/router/app_router.dart';
import 'package:spotify/src/features/home/domain/entity/music_entity.dart';
import 'package:spotify/src/features/home/presentation/bloc/music_bloc/music_bloc.dart';
import 'package:spotify/src/features/home/presentation/provider/music_provider.dart';
import 'package:spotify/src/utils/extension/mediaquery_extension.dart';

import '../../../../shared/widget/custom_icon.dart';
import '../../../../utils/contants/text_style.dart';

class PlayListMusic extends StatelessWidget {
  final int id;
  const PlayListMusic({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    MusicEntity music = context.read<MusicBloc>().state.musics![id];
    return InkWell(
      onTap: () async {
        context.read<MusicManager>().init(music.musicUrl!);
        context.router.push(
          MusicRoute(id: id),
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: context.dynamicWidth(0.15),
            height: context.dynamicHeight(0.071),
            child: Image.network(music.musicImage!),
          ),
          const SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.only(top: 7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  music.musicName!,
                  style: ConstantTextStyle.mediumTextStyle,
                ),
                const SizedBox(height: 5),
                Text(
                  'Skyptonite',
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
