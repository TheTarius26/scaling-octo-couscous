import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:scaling_octo_couscous/core/injector/injector.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDepedencies() => getIt.init();
