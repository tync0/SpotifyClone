import 'package:spotify/src/features/home/domain/entity/playlist_entity.dart';

class PlaylistModel extends PlaylistEntity {
  const PlaylistModel({
    super.id,
    super.musics,
    super.playlistImage,
    super.playlistName,
  });
  factory PlaylistModel.fromJson(Map<String, dynamic> json) {
    return PlaylistModel(
      id: json['id'],
      playlistImage: json['image'],
      playlistName: json['title'],
    );
  }
  factory PlaylistModel.fromJsonMusic(Map<String, dynamic> json) {
    return PlaylistModel(
      musics: json['songs'],
    );
  }
}
