import 'package:injectable/injectable.dart';
import 'package:scaling_octo_couscous/core/resource/use_case.dart';
import 'package:scaling_octo_couscous/domain/repository/products/i_product_repository.dart';

@singleton
class DeleteProductUsecase implements UseCase<void, String> {
  DeleteProductUsecase(this._productRepository);
  final IProductRepository _productRepository;
  @override
  Future<void> call(String params) async {
    final result = await _productRepository.deleteProduct(params);
    return result.fold(
      (l) => throw l,
      (r) => r,
    );
  }
}
