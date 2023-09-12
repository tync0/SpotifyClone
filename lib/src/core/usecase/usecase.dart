abstract class GetPlaylistInitialUseCase<T> {
  Future<T> call();
}

abstract class GetMusicUseCase<T> {
  Future<T> call(int id);
}
