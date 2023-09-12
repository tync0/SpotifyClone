import 'package:flutter/material.dart';
import 'package:spotify/src/config/router/app_router.dart';
import 'package:spotify/src/config/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final appRouter = AppRouter();
  runApp(
    MaterialApp.router(
      title: 'FoodMania',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      routerConfig: appRouter.config(),
    ),
  );
}
