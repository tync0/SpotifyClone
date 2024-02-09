part of 'music_bloc.dart';

abstract class MusicEvent extends Equatable {}

class GetMusicEvent extends MusicEvent {
  final int id;
  GetMusicEvent(this.id);
  @override
  List<Object> get props => [id];
}
