part of 'playlist_bloc.dart';

@immutable
sealed class PlaylistState extends Equatable {
  final List<PlaylistEntity>? playlists;
  final DioException? error;
  const PlaylistState({
    this.playlists,
    this.error,
  });
}

class PlaylistInitial extends PlaylistState {
  @override
  List<Object?> get props => [];
}

class PlaylistLoading extends PlaylistState {
  @override
  List<Object?> get props => [];
}

class PlaylistFailure extends PlaylistState {
  const PlaylistFailure(DioException error) : super(error: error);
  @override
  List<Object?> get props => [error];
}

class PlaylistSuccess extends PlaylistState {
  const PlaylistSuccess(List<PlaylistEntity> playlists)
      : super(playlists: playlists);
  @override
  List<Object?> get props => [playlists];
}
