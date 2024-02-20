// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeView(),
      );
    },
    LibraryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LibraryView(),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainView(),
      );
    },
    MusicRoute.name: (routeData) {
      final args = routeData.argsAs<MusicRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MusicView(
          key: args.key,
          id: args.id,
        ),
      );
    },
    PlayListRoute.name: (routeData) {
      final args = routeData.argsAs<PlayListRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PlayListView(
          key: args.key,
          id: args.id,
          imageUrl: args.imageUrl,
        ),
      );
    },
    SearchRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SearchView(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashView(),
      );
    },
  };
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LibraryView]
class LibraryRoute extends PageRouteInfo<void> {
  const LibraryRoute({List<PageRouteInfo>? children})
      : super(
          LibraryRoute.name,
          initialChildren: children,
        );

  static const String name = 'LibraryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainView]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MusicView]
class MusicRoute extends PageRouteInfo<MusicRouteArgs> {
  MusicRoute({
    Key? key,
    required int id,
    List<PageRouteInfo>? children,
  }) : super(
          MusicRoute.name,
          args: MusicRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'MusicRoute';

  static const PageInfo<MusicRouteArgs> page = PageInfo<MusicRouteArgs>(name);
}

class MusicRouteArgs {
  const MusicRouteArgs({
    this.key,
    required this.id,
  });

  final Key? key;

  final int id;

  @override
  String toString() {
    return 'MusicRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [PlayListView]
class PlayListRoute extends PageRouteInfo<PlayListRouteArgs> {
  PlayListRoute({
    Key? key,
    required int id,
    required String imageUrl,
    List<PageRouteInfo>? children,
  }) : super(
          PlayListRoute.name,
          args: PlayListRouteArgs(
            key: key,
            id: id,
            imageUrl: imageUrl,
          ),
          initialChildren: children,
        );

  static const String name = 'PlayListRoute';

  static const PageInfo<PlayListRouteArgs> page =
      PageInfo<PlayListRouteArgs>(name);
}

class PlayListRouteArgs {
  const PlayListRouteArgs({
    this.key,
    required this.id,
    required this.imageUrl,
  });

  final Key? key;

  final int id;

  final String imageUrl;

  @override
  String toString() {
    return 'PlayListRouteArgs{key: $key, id: $id, imageUrl: $imageUrl}';
  }
}

/// generated route for
/// [SearchView]
class SearchRoute extends PageRouteInfo<void> {
  const SearchRoute({List<PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashView]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
