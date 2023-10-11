import 'dart:typed_data';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';
import '../../../common/models/product_model.dart';
import '../../../common/repository/repository.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductMainState> {
  final Repository repository;

  ProductBloc({required this.repository})
      : super(const ProductMainState(
            status: ProductStatus.initial, products: [])) {
    on<ProductEvent>(
      (event, emit) => switch (event) {
        ProductGetDataEvent e => _getAllData(e, emit),
        ProductCreateEvent e => _createData(e, emit),
        _ => () {},
      },
    );
  }

  void _getAllData(ProductGetDataEvent event, Emitter emit) async {
    final data = await repository.getAllProduct();
    if(data!= null) {
      emit(state.copyWith(products: data));
    }
  }

  void _createData(ProductCreateEvent event, Emitter emit) async {
    List<String> files = [];
    for (var element in event.files) {
      files.add(await repository.storePicture(element));
    }

    final product = Product(
      productId: const Uuid().v4(),
      productName: event.name,
      productDescription: event.description,
      productPrice: event.price,
      productType: event.type,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      likedProduct: false,
      images: files,
      genderType: event.genderType,
    );
    final result = await repository.storeProduct(product);
    if (result) {
      emit(state.copyWith(status: ProductStatus.successCreate));
    }
    emit(state.copyWith(status: ProductStatus.errorCreate));
  }
}
