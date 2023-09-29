import '../models/product_model.dart';

abstract class Repository {
  const Repository();
  Future<List<Product>?> getAllProduct();
  Future<bool> storeProduct(Product product);
}