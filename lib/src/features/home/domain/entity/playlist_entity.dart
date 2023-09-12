import 'music_entity.dart';

class PlaylistEntity {
  final int? id;
  final String? playlistName;
  final String? playlistImage;
  final List<MusicEntity?>? musics;
  const PlaylistEntity({
    this.musics,
    this.playlistImage,
    this.playlistName,
    this.id,
  });
}
