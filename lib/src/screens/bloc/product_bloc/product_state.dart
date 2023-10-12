part of 'product_bloc.dart';

enum ProductStatus {
  initial,
  successCreate,
  successData,
  successUpdate,
  successDelete,
  errorCreate,
  errorData,
  errorDelete,
  errorUpdate,
}

class ProductMainState extends Equatable {
  final ProductStatus status;
  final List<Product> products;
  final String? message;

  const ProductMainState({required this.products, required this.status, this.message});

  @override
  List<Object> get props => [status, products, message ?? ""];

  ProductMainState copyWith({
    ProductStatus? status,
    List<Product>? products,
    String? message,
  }) {
    return ProductMainState(
      status: status ?? this.status,
      products: products ?? this.products,
      message: message ?? this.message,
    );
  }
}
