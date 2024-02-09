import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:spotify/bloc_observer.dart';
import 'package:spotify/injection_container.dart';
import 'package:spotify/src/config/router/app_router.dart';
import 'package:spotify/src/config/theme/app_theme.dart';
import 'package:spotify/src/features/home/presentation/bloc/music_bloc/music_bloc.dart';
import 'package:spotify/src/features/home/presentation/bloc/playlist_bloc/playlist_bloc.dart';
import 'package:spotify/src/features/home/presentation/provider/music_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  Bloc.observer = MyBlocObserver();
  final appRouter = AppRouter();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<PlaylistBloc>(
          create: (context) => s1<PlaylistBloc>()..add(GetPlaylistEvent()),
        ),
        BlocProvider<MusicBloc>(
          create: (context) => s1<MusicBloc>(),
        ),
        ChangeNotifierProvider<MusicManager>(
          create: (context) => MusicManager(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Spotify',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.appTheme,
        routerConfig: appRouter.config(),
      ),
    ),
  );
}
