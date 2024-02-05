import 'package:spotify/src/core/resource/data_state.dart';
import 'package:spotify/src/core/usecase/usecase.dart';
import 'package:spotify/src/features/home/domain/repository/playlist_repository.dart';

import '../entity/playlists_entity.dart';

class GetPlaylistInitialUseCaseImpl implements GetPlaylistInitialUseCase {
  final PlaylistRepository _repository;
  const GetPlaylistInitialUseCaseImpl(this._repository);
  @override
  Future<DataState<PlaylistsEntity>> call() {
    return _repository.getPlaylistInitial();
  }
}
