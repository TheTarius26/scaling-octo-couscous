import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:scaling_octo_couscous/domain/entity/product/product.dart';

@injectable
class ProductLocalStorage {
  static const String _boxName = 'products';

  Future<Box<Product>> get _box async => 
      await Hive.openBox<Product>(_boxName);

  Future<void> saveProducts(List<Product> products) async {
    final box = await _box;
    await box.clear();
    await box.addAll(products);
  }

  Future<List<Product>> getProducts() async {
    final box = await _box;
    return box.values.toList();
  }

  Future<void> deleteProduct(String id) async {
    final box = await _box;
    final key = box.values.toList().indexWhere((product) => product.id == id);
    if (key != -1) {
      await box.deleteAt(key);
    }
  }
}
