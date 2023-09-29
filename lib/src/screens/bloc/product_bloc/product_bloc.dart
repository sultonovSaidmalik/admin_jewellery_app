import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../common/models/product_model.dart';
import '../../../common/repository/repository.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final Repository repository;

  ProductBloc({required this.repository})
      : super(const ProductMainState(
            status: ProductStatus.initial, products: [])) {
    on<ProductEvent>(
      (event, emit) => switch (event) {
        ProductGetDataEvent e => _getAllData(e, emit),
        _ => () {},
      },
    );
  }

  void _getAllData(ProductGetDataEvent event, Emitter emit) async {
    repository.getAllProduct();
  }
}
