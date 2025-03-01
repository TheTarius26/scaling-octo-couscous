import 'package:flutter/material.dart';
import 'package:scaling_octo_couscous/config/theme/app_theme.dart';
import 'package:scaling_octo_couscous/core/injector/injector.dart';
import 'package:scaling_octo_couscous/core/routes/route.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'template_mobile_app',
      routerConfig: getIt<AppRoute>().config(),
      theme: AppTheme.lightTheme,
    );
  }
}
