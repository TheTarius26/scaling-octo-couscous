import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scaling_octo_couscous/config/app/app.dart';
import 'package:scaling_octo_couscous/core/injector/injector.dart';
import 'package:scaling_octo_couscous/core/local/hive_init.dart';
import 'package:scaling_octo_couscous/core/resource/app_error.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
  }
}

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDepedencies();
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();
  FlutterError.onError = (FlutterErrorDetails details) {};
  Bloc.observer = AppBlocObserver();

  runZonedGuarded(
    () => runApp(const App()),
    (error, stack) {
      throw AppError.handleError(error);
    },
  );
}
