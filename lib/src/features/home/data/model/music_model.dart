import '../../domain/entity/music_entity.dart';

class MusicModel extends MusicEntity {
  MusicModel({
    super.musicImage,
    super.musicName,
    super.singer,
  });
  factory MusicModel.fromJson(Map<String, dynamic> json) {
    return MusicModel(
      musicImage: json['image'],
      musicName: json['title'],
      singer: json['singer'],
    );
  }
}
