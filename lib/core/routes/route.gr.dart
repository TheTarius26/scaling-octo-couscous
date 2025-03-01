// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'route.dart';

/// generated route for
/// [DetailProductScreen]
class DetailProductRoute extends PageRouteInfo<DetailProductRouteArgs> {
  DetailProductRoute({
    required String productId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          DetailProductRoute.name,
          args: DetailProductRouteArgs(
            productId: productId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailProductRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DetailProductRouteArgs>();
      return DetailProductScreen(
        productId: args.productId,
        key: args.key,
      );
    },
  );
}

class DetailProductRouteArgs {
  const DetailProductRouteArgs({
    required this.productId,
    this.key,
  });

  final String productId;

  final Key? key;

  @override
  String toString() {
    return 'DetailProductRouteArgs{productId: $productId, key: $key}';
  }
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}
