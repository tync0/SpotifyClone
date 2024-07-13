import 'package:spotify/src/utils/contants/api.dart';

import '../../domain/entity/music_entity.dart';

class MusicModel extends MusicEntity {
  MusicModel({
    super.musicImage,
    super.musicName,
    super.musicUrl,
    super.artistName,
  });
  factory MusicModel.fromJson(Map<String, dynamic> json) {
    return MusicModel(
      musicImage: json['image'],
      musicName: json['name'],
      musicUrl: "${ServiceConst.baseUrl}/${json['file']}",
      artistName: json['artist'],
    );
  }
}
