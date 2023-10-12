part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class ProductGetDataEvent extends ProductEvent {
  const ProductGetDataEvent();

  @override
  List<Object?> get props => [];
}

class ProductCreateEvent extends ProductEvent {
  final List<Uint8List> files;
  final String name;
  final String description;
  final String type;
  final String genderType;
  final num price;

  const ProductCreateEvent({
    required this.name,
    required this.description,
    required this.files,
    required this.price,
    required this.type,
    required this.genderType,
  });

  @override
  List<Object?> get props =>
      [name, description, files, price, type, genderType];
}

class ProductDeleteEvent extends ProductEvent {
  final String productId;

  const ProductDeleteEvent({required this.productId});

  @override
  List<Object?> get props => [];
}

class ProductUpdateEvent extends ProductEvent {
  final Product product;

  const ProductUpdateEvent({required this.product});

  @override
  List<Object?> get props => [product];
}
