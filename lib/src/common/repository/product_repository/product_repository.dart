import 'package:admin_jewellery_app/src/common/models/product_model.dart';
import 'package:admin_jewellery_app/src/common/repository/repository.dart';
import 'package:firebase_database/firebase_database.dart';

class ProductRepository extends Repository {
  late final FirebaseDatabase _db;
  late final _storage = _db.ref("app");

  ProductRepository() : _db = FirebaseDatabase.instance;

  @override
  Future<List<Product>?> getAllProduct() async {
    try {
      final data = await _storage.child(Folder.products.name).get();
      return [];
    }catch(e, s) {
      print(e);
      print(s);
      return null;
    }
  }

  @override
  Future<bool> storeProduct(Product product) async {
    try {
      final folder =
          _storage.child(Folder.products.name).child(product.productId!);
      await folder.set(product.toJson());
      return true;
    } catch (e, s) {
      print(e);
      print(s);
      return false;
    }
  }
}

enum Folder {
  products,
}
