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

  const ProductCreateEvent();

  @override
  List<Object?> get props => [];
}
