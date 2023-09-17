import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify/src/config/router/app_router.dart';
import 'package:spotify/src/config/theme/app_theme.dart';
import 'package:spotify/src/features/home/presentation/provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final appRouter = AppRouter();
  runApp(
    ChangeNotifierProvider<Button>(
      create: (context) => Button(),
      child: MaterialApp.router(
        title: 'Spotify',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.appTheme,
        routerConfig: appRouter.config(),
      ),
    ),
  );
}
