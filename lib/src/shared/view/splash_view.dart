import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/injection_container.dart';
import 'package:spotify/src/features/home/presentation/bloc/playlist_bloc/playlist_bloc.dart';
import 'package:spotify/src/utils/contants/colors.dart';
import 'package:spotify/src/utils/extension/mediaquery_extension.dart';

@RoutePage()
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    //s1<PlaylistBloc>().add(GetPlaylistEvent());
    changeScreen(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: context.mediaQueryWidth,
          height: context.mediaQueryHeight / 4,
          child: SvgPicture.asset(
            'assets/svg/spotify_logo.svg',
            colorFilter: const ColorFilter.mode(
              AppColor.primaryColor,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> changeScreen(BuildContext context) async {
  Future.delayed(
    const Duration(milliseconds: 2000),
    () => context.router.replaceNamed('/main'),
  );
}
