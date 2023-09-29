part of 'product_bloc.dart';

enum ProductStatus { initial, successCreate, errorCreate, successData}


class ProductMainState extends Equatable {
  final ProductStatus status;
  final List<Product> products;

  const ProductMainState({required this.products, required this.status});



  @override
  List<Object> get props => [status];

  ProductMainState copyWith({
    ProductStatus? status,
    List<Product>? products,
  }) {
    return ProductMainState(
      status: status ?? this.status,
      products: products ?? this.products,
    );
  }
}
