import 'package:either_dart/either.dart';
import 'package:scaling_octo_couscous/core/resource/app_error.dart';
import 'package:scaling_octo_couscous/data/model/product_request.dart';
import 'package:scaling_octo_couscous/domain/entity/product/product.dart';

abstract class IProductRepository {
  Future<Either<AppError, List<Product>>> getProducts(
    ProductRequest request,
  );

  Future<Either<AppError, Product>> getProduct(String id);

  Future<Either<AppError, Product>> createProduct(Product product);

  Future<Either<AppError, Product>> updateProduct(Product product);

  Future<Either<AppError, void>> deleteProduct(String id);
}
