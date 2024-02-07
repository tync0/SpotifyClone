import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:spotify/src/features/home/data/datasource/main_service.dart';
import 'package:spotify/src/features/home/domain/repository/playlist_repository.dart';
import 'package:spotify/src/features/home/domain/usecase/get_music_usecase.dart';
import 'package:spotify/src/features/home/domain/usecase/get_playlist_usecase.dart';
import 'package:spotify/src/features/home/presentation/bloc/music_bloc/music_bloc.dart';
import 'package:spotify/src/features/home/presentation/bloc/playlist_bloc/playlist_bloc.dart';

import 'src/core/interceptor/token_interceptor.dart';
import 'src/features/home/data/repository/playlist_repository_impl.dart';

GetIt s1 = GetIt.instance;

Future<void> initializeDependencies() async {
  //dio
  s1.registerLazySingleton<Dio>(() => Dio());
  //interceptor
  s1.registerLazySingleton<TokenInterceptor>(() => TokenInterceptor());
  //network service
  s1.registerLazySingleton<MainService>(
    () => MainService(s1()),
  );

  //repository
  s1.registerLazySingleton<MainRepository>(
    () => MainRepositoryImpl(s1()),
  );

  //usecase
  s1.registerLazySingleton<GetPlaylistUsecaseImpl>(
    () => GetPlaylistUsecaseImpl(s1<MainRepository>()),
  );

  s1.registerLazySingleton<GetMusicUseCaseImpl>(
    () => GetMusicUseCaseImpl(s1<MainRepository>()),
  );

  //blocs
  s1.registerFactory<PlaylistBloc>(
    () => PlaylistBloc(s1<GetPlaylistUsecaseImpl>()),
  );
  s1.registerFactory<MusicBloc>(
    () => MusicBloc(s1<GetMusicUseCaseImpl>()),
  );
}
