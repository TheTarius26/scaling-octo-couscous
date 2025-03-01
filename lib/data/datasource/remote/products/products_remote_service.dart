import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:scaling_octo_couscous/domain/entity/product/product.dart';

part 'products_remote_service.g.dart';

@RestApi()
@injectable
abstract class ProductsRemoteService {
  @factoryMethod
  factory ProductsRemoteService(Dio dio) = _ProductsRemoteService;

  @GET('/products')
  Future<List<Product>> getProducts();

  @GET('/products/{id}')
  Future<Product> getProduct(@Path('id') String id);

  @POST('/products')
  Future<Product> createProduct(@Body() Product product);

  @PUT('/products/{id}')
  Future<Product> updateProduct(@Path('id') String id, @Body() Product product);

  @DELETE('/products/{id}')
  Future<void> deleteProduct(@Path('id') String id);
}
