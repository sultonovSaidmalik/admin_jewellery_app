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
        ProductDeleteEvent e => _deleteData(e, emit),
        ProductUpdateEvent e => _updateData(e, emit),
        _ => () {},
      },
    );
  }

  void _getAllData(ProductGetDataEvent event, Emitter emit) async {
    final data = await repository.getAllProduct();
    if (data != null) {
      emit(state.copyWith(products: data, status: ProductStatus.successData));
    }else {
      emit(state.copyWith(status: ProductStatus.errorData, message: "Malumot o'lishda xatolik Qaytaddan urinib ko'ring"));
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
    } else {
      emit(state.copyWith(
          status: ProductStatus.errorCreate,
          message: "Product Qo'shilmadi Iltimos Qayta urinib koring!"));
    }
  }

  void _deleteData(ProductDeleteEvent event, Emitter emit) async {
    final result = await repository.deleteProduct(event.productId);
    if (result) {
      emit(state.copyWith(
          status: ProductStatus.successDelete, message: event.productId));
    } else {
      emit(state.copyWith(
          status: ProductStatus.errorDelete,
          message: "Product O'chirilmadi ! Iltimos Qayta urinib Ko'ring"));
    }
  }

  void _updateData(ProductUpdateEvent event, Emitter emit) async {
    final result = await repository.updateProduct(event.product);
    if (result) {
      emit(state.copyWith(
          status: ProductStatus.successUpdate,
          message: event.product.productId));
    } else {
      emit(state.copyWith(
          status: ProductStatus.errorUpdate,
          message: "Product Yangilanmadi ! Iltimos Qayta urinib Ko'ring"));
    }
  }
}
