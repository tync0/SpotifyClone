import 'package:spotify/src/core/resource/data_state.dart';
import 'package:spotify/src/features/home/domain/entity/music_entity.dart';
import 'package:spotify/src/features/home/domain/entity/playlists_entity.dart';

abstract class PlaylistRepository {
  Future<DataState<PlaylistsEntity>> getPlaylistInitial();
  Future<DataState<List<MusicEntity>>> getMusic(int id);
}
