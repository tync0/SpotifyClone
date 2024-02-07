part of 'music_bloc.dart';

sealed class MusicEvent extends Equatable {
  final int id;
  const MusicEvent(this.id);

  @override
  List<Object> get props => [];
}
