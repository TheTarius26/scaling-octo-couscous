import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:scaling_octo_couscous/presentation/module/detail_product/view/detail_product_screen.dart';
import 'package:scaling_octo_couscous/presentation/module/home/view/home_screen.dart';

part 'route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRoute extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: DetailProductRoute.page),
      ];

  @override
  RouteType get defaultRouteType => const RouteType.material();
}
