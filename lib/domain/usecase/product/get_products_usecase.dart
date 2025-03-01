import 'package:injectable/injectable.dart';
import 'package:scaling_octo_couscous/core/resource/use_case.dart';
import 'package:scaling_octo_couscous/data/model/product_request.dart';
import 'package:scaling_octo_couscous/domain/entity/product/product.dart';
import 'package:scaling_octo_couscous/domain/repository/products/i_product_repository.dart';

@singleton
class GetProductsUsecase implements UseCase<List<Product>, ProductRequest> {
  GetProductsUsecase(this._productRepository);
  final IProductRepository _productRepository;

  @override
  Future<List<Product>> call(ProductRequest params) async {
    final result = await _productRepository.getProducts(params);
    return result.fold(
      (l) => throw l,
      (r) => r,
    );
  }
}
