import 'singer_entity.dart';

class MusicEntity {
  final String? musicName;
  final String? musicImage;
  final SingerEntity? singer;
  const MusicEntity({
    this.musicImage,
    this.musicName,
    this.singer,
  });
}
