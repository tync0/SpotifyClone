import 'package:spotify/src/features/home/domain/entity/playlist_entity.dart';

class PlaylistModel extends PlaylistEntity {
  const PlaylistModel({
    super.id,
    super.playlistImage,
    super.playlistName,
  });
  factory PlaylistModel.fromJson(Map<String, dynamic> json) {
    return PlaylistModel(
      id: json['ID'],
      playlistImage: json['image'],
      playlistName: json['name'],
    );
  }
}
