// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:dotenv/dotenv.dart' as _i320;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:scaling_octo_couscous/core/module/modules.dart' as _i953;
import 'package:scaling_octo_couscous/core/routes/route.dart' as _i291;
import 'package:scaling_octo_couscous/data/datasource/remote/products/products_remote_service.dart'
    as _i77;
import 'package:scaling_octo_couscous/data/repository/products/product_repository_impl.dart'
    as _i1041;
import 'package:scaling_octo_couscous/domain/repository/products/i_product_repository.dart'
    as _i891;
import 'package:scaling_octo_couscous/domain/usecase/product/create_product_usecase.dart'
    as _i1033;
import 'package:scaling_octo_couscous/domain/usecase/product/delete_product_usecase.dart'
    as _i118;
import 'package:scaling_octo_couscous/domain/usecase/product/get_product_by_id_usecase.dart'
    as _i1010;
import 'package:scaling_octo_couscous/domain/usecase/product/get_products_usecase.dart'
    as _i331;
import 'package:scaling_octo_couscous/domain/usecase/product/update_product_usecase.dart'
    as _i16;
import 'package:scaling_octo_couscous/presentation/module/home/bloc/home_bloc.dart'
    as _i17;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final thirdPartyModule = _$ThirdPartyModule();
  gh.factory<_i320.DotEnv>(() => thirdPartyModule.getEnv());
  gh.factory<_i361.Dio>(() => thirdPartyModule.mainDioClient());
  gh.singleton<_i291.AppRoute>(() => _i291.AppRoute());
  gh.factory<_i77.ProductsRemoteService>(
      () => _i77.ProductsRemoteService(gh<_i361.Dio>()));
  gh.singleton<_i891.IProductRepository>(
      () => _i1041.ProductRepositoryImpl(gh<_i77.ProductsRemoteService>()));
  gh.singleton<_i1033.CreateProductUsecase>(
      () => _i1033.CreateProductUsecase(gh<_i891.IProductRepository>()));
  gh.singleton<_i16.UpdateProductUsecase>(
      () => _i16.UpdateProductUsecase(gh<_i891.IProductRepository>()));
  gh.singleton<_i1010.GetProductByIdUsecase>(
      () => _i1010.GetProductByIdUsecase(gh<_i891.IProductRepository>()));
  gh.singleton<_i118.DeleteProductUsecase>(
      () => _i118.DeleteProductUsecase(gh<_i891.IProductRepository>()));
  gh.singleton<_i331.GetProductsUsecase>(
      () => _i331.GetProductsUsecase(gh<_i891.IProductRepository>()));
  gh.factory<_i17.HomeBloc>(() => _i17.HomeBloc(
        gh<_i331.GetProductsUsecase>(),
        gh<_i118.DeleteProductUsecase>(),
      ));
  return getIt;
}

class _$ThirdPartyModule extends _i953.ThirdPartyModule {}
