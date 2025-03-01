import 'package:injectable/injectable.dart';
import 'package:scaling_octo_couscous/core/resource/use_case.dart';
import 'package:scaling_octo_couscous/domain/entity/product/product.dart';
import 'package:scaling_octo_couscous/domain/repository/products/i_product_repository.dart';

@singleton
class UpdateProductUsecase implements UseCase<Product, Product> {
  UpdateProductUsecase(this._productRepository);
  final IProductRepository _productRepository;
  @override
  Future<Product> call(Product params) async {
    final result = await _productRepository.updateProduct(params);
    return result.fold(
      (l) => throw l,
      (r) => r,
    );
  }
}
