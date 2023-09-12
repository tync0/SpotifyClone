import 'package:spotify/src/core/resource/data_state.dart';
import 'package:spotify/src/core/usecase/usecase.dart';
import 'package:spotify/src/features/home/domain/entity/music_entity.dart';
import 'package:spotify/src/features/home/domain/repository/playlist_repository.dart';

class GetMusicUseCaseImpl implements GetMusicUseCase {
  final PlaylistRepository _repository;
  const GetMusicUseCaseImpl(this._repository);
  @override
  Future<DataState<List<MusicEntity>>> call(int id) {
    return _repository.getMusic(id);
  }
}
