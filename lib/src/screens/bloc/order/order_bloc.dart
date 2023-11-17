import 'package:admin_jewellery_app/src/common/repository/order_repository/order_repository_impl.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../common/models/order_model.dart';
import '../../../common/repository/order_repository/order_repository.dart';

part 'order_event.dart';

part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRepository repository;

  OrderBloc()
      : repository = OrderRepositoryImpl(),
        super(
          const OrderState(status: OrderStatus.initial, orders: []),
        ) {
    on<GetOrderEvent>(_getOrders);
  }

  void _getOrders(GetOrderEvent event, Emitter emit) async {
    emit(state.copyWith(status: OrderStatus.loading));
    final data = await repository.getOrders();
    if (data != null) {
      emit(state.copyWith(status: OrderStatus.getSuccess, orders: data));
    } else {
      emit(state.copyWith(status: OrderStatus.getError));
    }
  }
}
