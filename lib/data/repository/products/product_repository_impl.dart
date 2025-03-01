import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:scaling_octo_couscous/core/resource/app_error.dart';
import 'package:scaling_octo_couscous/data/datasource/remote/products/products_remote_service.dart';
import 'package:scaling_octo_couscous/data/model/product_request.dart';
import 'package:scaling_octo_couscous/domain/entity/product/product.dart';
import 'package:scaling_octo_couscous/domain/repository/products/i_product_repository.dart';

@Singleton(as: IProductRepository)
class ProductRepositoryImpl implements IProductRepository {
  ProductRepositoryImpl(this._productsRemoteService);

  final ProductsRemoteService _productsRemoteService;

  @override
  Future<Either<AppError, List<Product>>> getProducts(
    ProductRequest request,
  ) async {
    try {
      final products = await _productsRemoteService.getProducts();
      return Right(products);
    } on AppError catch (e) {
      return Left(AppError.handleError(e));
    }
  }

  @override
  Future<Either<AppError, Product>> createProduct(Product product) async {
    try {
      final createdProduct =
          await _productsRemoteService.createProduct(product);
      return Right(createdProduct);
    } on AppError catch (e) {
      return Left(AppError.handleError(e));
    }
  }

  @override
  Future<Either<AppError, void>> deleteProduct(String id) async {
    try {
      await _productsRemoteService.deleteProduct(id);
      return const Right(null);
    } on AppError catch (e) {
      return Left(AppError.handleError(e));
    }
  }

  @override
  Future<Either<AppError, Product>> updateProduct(Product product) async {
    try {
      final updatedProduct = await _productsRemoteService.updateProduct(
        product.id,
        product,
      );
      return Right(updatedProduct);
    } on AppError catch (e) {
      return Left(AppError.handleError(e));
    }
  }

  @override
  Future<Either<AppError, Product>> getProduct(String id) async {
    try {
      final product = await _productsRemoteService.getProduct(id);
      return Right(product);
    } on AppError catch (e) {
      return Left(AppError.handleError(e));
    }
  }
}
