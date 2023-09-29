
import 'dart:convert';
import 'dart:io';

import 'package:admin_jewellery_app/src/common/models/product_model.dart';
import 'package:admin_jewellery_app/src/common/repository/repository.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProductRepository extends Repository {
  late final FirebaseDatabase _db;
  late final FirebaseStorage _st;

  late final _storage = _db.ref("app");

  ProductRepository() : _db = FirebaseDatabase.instance, _st = FirebaseStorage.instance;

  @override
  Future<List<Product>?> getAllProduct() async {
    try {
      final data = await _storage.child(Folder.products.name).get();
      return data.children.map((e) => Product.fromJson(jsonDecode(jsonEncode(e.value)))).toList();
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

  @override
  Future<String> storePicture(File file) async {
    final image = _st.ref(Folder.images.name).child("image_${DateTime.now().toIso8601String()}${file.path.substring(file.path.lastIndexOf("."))}" );
    final task = image.putFile(file);
    await task.whenComplete(() {});
    return image.getDownloadURL();
  }
}

enum Folder {
  products,
  images,
}
