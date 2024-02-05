import 'package:spotify/src/features/home/domain/entity/playlists_entity.dart';

class PlaylistsModel extends PlaylistsEntity {
  PlaylistsModel({
    super.playlists,
  });
  factory PlaylistsModel.fromJson(Map<String, dynamic> json) {
    return PlaylistsModel(
      playlists: json['result'],
    );
  }
}
