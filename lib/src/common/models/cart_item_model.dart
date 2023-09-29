import 'product_model.dart';

class CartItem {
  String? id;
  Product? product;
  int? productCount;
  num? totalPrice;

  CartItem({
    required this.id,
    required this.product,
    required this.productCount,
    required this.totalPrice,
  });

  factory CartItem.fromJson(Map<String, Object?> json) => CartItem(
      id : json["id"] as String,
      product : json["product"] as Product,
      productCount : json["productCount"] as int,
      totalPrice : json["totalPrice"] as num,
  );

  Map<String, Object?> toJson() => {
    "id" : id,
    "product" : product,
    "productCount" : productCount,
    "totalPrice" : totalPrice,
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartItem &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          product == other.product &&
          productCount == other.productCount &&
          totalPrice == other.totalPrice;

  @override
  int get hashCode =>
      id.hashCode ^
      product.hashCode ^
      productCount.hashCode ^
      totalPrice.hashCode;

  @override
  String toString() {
    return 'CartItem{id: $id, product: $product, productCount: $productCount, totalPrice: $totalPrice}';
  }
}
