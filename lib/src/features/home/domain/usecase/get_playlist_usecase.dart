import 'package:spotify/src/core/resource/data_state.dart';
import 'package:spotify/src/core/usecase/usecase.dart';
import 'package:spotify/src/features/home/domain/entity/playlist_entity.dart';

import '../repository/main_repository.dart';

class GetPlaylistUsecaseImpl
    implements GetPlaylistUsecase<DataState<List<PlaylistEntity>>> {
  final MainRepository _repository;
  const GetPlaylistUsecaseImpl(this._repository);
  @override
  Future<DataState<List<PlaylistEntity>>> call() async {
    return _repository.getPlaylist();
  }
}
