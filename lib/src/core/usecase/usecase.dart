abstract class GetPlaylistUsecase<T> {
  Future<T> call();
}

abstract class GetMusicUsecase<T> {
  Future<T> call(int id);
}
