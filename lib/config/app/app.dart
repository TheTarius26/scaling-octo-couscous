import 'package:flutter/material.dart';
import 'package:scaling_octo_couscous/config/theme/app_theme.dart';
import 'package:scaling_octo_couscous/core/routes/route.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final AppRoute _appRoute = AppRoute();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'template_mobile_app',
      routerConfig: _appRoute.config(),
      theme: AppTheme.lightTheme,
    );
  }
}
