import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:spotify/src/config/router/app_router.dart';
import 'package:spotify/src/features/home/domain/entity/playlist_entity.dart';
import 'package:spotify/src/utils/contants/text_style.dart';
import 'package:spotify/src/utils/extension/mediaquery_extension.dart';

class ShowsMix extends StatelessWidget {
  final PlaylistEntity _playlistEntity;
  const ShowsMix(this._playlistEntity, {super.key});

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
              context.router.push(
                PlayListRoute(
                  id: _playlistEntity.id!,
                ),
              );
            },
            child: SizedBox(
              width: context.dynamicWidth(0.4),
              height: context.dynamicHeight(0.19),
              child: Image.network(
                _playlistEntity.playlistImage!,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Text(
              _playlistEntity.playlistName ?? "",
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
