import 'package:spotify/src/core/resource/data_state.dart';
import 'package:spotify/src/features/home/domain/entity/music_entity.dart';
import 'package:spotify/src/features/home/domain/entity/playlist_entity.dart';

abstract class MainRepository {
  Future<DataState<List<PlaylistEntity>>> getPlaylist();
  Future<DataState<List<MusicEntity>>> getMusics(int id);
}
