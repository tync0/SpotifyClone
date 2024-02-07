part of 'music_bloc.dart';

sealed class MusicState extends Equatable {
  final List<MusicEntity>? musics;
  final DioException? error;
  const MusicState({
    this.error,
    this.musics,
  });
}

class MusicInitial extends MusicState {
  @override
  List<Object> get props => [];
}

class MusicLoading extends MusicState {
  @override
  List<Object> get props => [];
}

class MusicFailure extends MusicState {
  const MusicFailure(DioException error) : super(error: error);
  @override
  List<Object> get props => [error!];
}

class MusicSuccess extends MusicState {
  const MusicSuccess(List<MusicEntity> musics) : super(musics: musics);
  @override
  List<Object> get props => [musics!];
}
