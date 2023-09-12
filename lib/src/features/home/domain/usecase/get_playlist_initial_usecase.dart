import 'package:spotify/src/core/resource/data_state.dart';
import 'package:spotify/src/core/usecase/usecase.dart';
import 'package:spotify/src/features/home/domain/entity/playlist_entity.dart';
import 'package:spotify/src/features/home/domain/repository/playlist_repository.dart';

class GetPlaylistInitialUseCaseImpl implements GetPlaylistInitialUseCase {
  final PlaylistRepository _repository;
  const GetPlaylistInitialUseCaseImpl(this._repository);
  @override
  Future<DataState<List<PlaylistEntity>>> call() {
    return _repository.getPlaylistInitial();
  }
}
