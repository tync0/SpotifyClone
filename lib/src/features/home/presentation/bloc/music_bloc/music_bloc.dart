import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/src/core/resource/data_state.dart';
import 'package:spotify/src/features/home/domain/entity/music_entity.dart';
import 'package:spotify/src/features/home/domain/usecase/get_music_usecase.dart';

part 'music_event.dart';
part 'music_state.dart';

class MusicBloc extends Bloc<MusicEvent, MusicState> {
  final GetMusicUseCaseImpl _getMusicUseCaseImpl;
  MusicBloc(this._getMusicUseCaseImpl) : super(MusicInitial()) {
    on<MusicEvent>(
      (event, emit) async {
        emit(MusicLoading());
        try {
          final dataState = await _getMusicUseCaseImpl.call(event.id);
          if (dataState is DataSuccess) {
            emit(
              MusicSuccess(dataState.data!),
            );
          } else {
            emit(
              MusicFailure(dataState.error!),
            );
          }
        } on DioException catch (e) {
          emit(
            MusicFailure(e),
          );
        }
      },
    );
  }
}
