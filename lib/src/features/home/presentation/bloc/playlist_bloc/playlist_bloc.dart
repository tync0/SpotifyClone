import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/src/core/resource/data_state.dart';
import 'package:spotify/src/features/home/domain/entity/playlist_entity.dart';
import 'package:spotify/src/features/home/domain/usecase/get_playlist_usecase.dart';

part 'playlist_event.dart';
part 'playlist_state.dart';

class PlaylistBloc extends Bloc<PlaylistEvent, PlaylistState> {
  final GetPlaylistUsecaseImpl _getPlaylistUsecaseImpl;
  PlaylistBloc(this._getPlaylistUsecaseImpl) : super(PlaylistInitial()) {
    on<GetPlaylistEvent>(
      (event, emit) async {
        emit(PlaylistLoading());
        try {
          final dataState = await _getPlaylistUsecaseImpl.call();
          if (dataState is DataSuccess) {
            emit(
              PlaylistSuccess(dataState.data!),
            );
          } else {
            emit(
              PlaylistFailure(dataState.error!),
            );
          }
        } on DioException catch (e) {
          emit(
            PlaylistFailure(e),
          );
        }
      },
    );
  }
}
