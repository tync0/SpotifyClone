import '../../domain/entity/music_entity.dart';

class MusicModel extends MusicEntity {
  MusicModel({
    super.musicImage,
    super.musicName,
    super.musicUrl,
    //super.singer,
  });
  factory MusicModel.fromJson(Map<String, dynamic> json) {
    return MusicModel(
      musicImage: json['image'],
      musicName: json['title'],
      musicUrl: json['audio'],
      //singer: json['singer'],
    );
  }
}
