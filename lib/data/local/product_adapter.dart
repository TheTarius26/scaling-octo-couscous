import 'package:hive/hive.dart';
import 'package:scaling_octo_couscous/domain/entity/product/product.dart';

class ProductAdapter extends TypeAdapter<Product> {
  @override
  final int typeId = 0;

  @override
  Product read(BinaryReader reader) {
    final Map<String, dynamic> json = {
      'name': reader.readString(),
      'PhotoUrl': reader.readString(),
      'createdAt': reader.readString(),
      'id': reader.readString(),
    };
    return Product.fromJson(json);
  }

  @override
  void write(BinaryWriter writer, Product obj) {
    writer.writeString(obj.name);
    writer.writeString(obj.photoUrl);
    writer.writeString(obj.createdAt.toIso8601String());
    writer.writeString(obj.id);
  }
}
