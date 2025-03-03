import 'package:hive_flutter/hive_flutter.dart';
import 'package:scaling_octo_couscous/data/local/product_adapter.dart';
import 'package:scaling_octo_couscous/domain/entity/product/product.dart';

Future<void> initHive() async {
  await Hive.initFlutter();
  
  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(ProductAdapter());
  }
}
