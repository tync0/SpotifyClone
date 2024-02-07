part of 'playlist_bloc.dart';

@immutable
sealed class PlaylistEvent {}

class GetPlaylistEvent extends PlaylistEvent {}
