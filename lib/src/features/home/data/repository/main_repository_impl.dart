import 'package:dio/dio.dart';
import 'package:spotify/src/core/resource/data_state.dart';
import 'package:spotify/src/features/home/data/model/music_model.dart';
import 'package:spotify/src/features/home/data/model/playlist_model.dart';

import '../../domain/repository/main_repository.dart';
import '../datasource/main_service.dart';

class MainRepositoryImpl implements MainRepository {
  final MainService _mainService;
  MainRepositoryImpl(this._mainService);
  @override
  Future<DataState<List<MusicModel>>> getMusics(int id) async {
    try {
      final httpResponse = await _mainService.getMusics(id);
      if (httpResponse.response.statusCode == 200) {
        List<MusicModel> musics = List<MusicModel>.from(
          httpResponse.response.data['songs'].map(
            (e) => MusicModel.fromJson(e),
          ),
        );
        return DataSuccess(musics);
      } else {
        return DataFailed(
          DioException(
            requestOptions: httpResponse.response.requestOptions,
            error: httpResponse.response.data,
            type: DioExceptionType.badResponse,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<List<PlaylistModel>>> getPlaylist() async {
    try {
      final httpResponse = await _mainService.getPlaylist();
      if (httpResponse.response.statusCode == 200) {
        List<PlaylistModel> musics = List<PlaylistModel>.from(
          httpResponse.response.data.map(
            (e) => PlaylistModel.fromJson(e),
          ),
        );
        return DataSuccess(musics);
      } else {
        return DataFailed(
          DioException(
            requestOptions: httpResponse.response.requestOptions,
            error: httpResponse.response.data,
            type: DioExceptionType.badResponse,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
