import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:spotify/src/features/home/presentation/view/home_view.dart';
import 'package:spotify/src/features/library/presentation/view/library_view.dart';
import 'package:spotify/src/features/search/presentation/view/search_view.dart';
import 'package:spotify/src/shared/view/main_view.dart';

import '../../features/home/domain/entity/music_entity.dart';
import '../../features/home/presentation/view/music_view.dart';
import '../../features/home/presentation/view/playlist_view.dart';
import '../../shared/view/splash_view.dart';
part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          path: '/splash',
          initial: true,
        ),
        AutoRoute(
          page: MainRoute.page,
          path: '/main',
          //initial: true,
          children: [
            AutoRoute(
              page: HomeRoute.page,
              path: 'home',
              initial: true,
            ),
            AutoRoute(
              page: SearchRoute.page,
              path: 'search',
            ),
            AutoRoute(
              page: LibraryRoute.page,
              path: 'library',
            ),
          ],
        ),
        AutoRoute(
          page: PlayListRoute.page,
          path: '/playlist',
        ),
        AutoRoute(
          page: MusicRoute.page,
          path: '/music',
        ),
      ];
}
