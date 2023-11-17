part of 'order_bloc.dart';

@immutable
class OrderState extends Equatable {
  final OrderStatus status;
  final List<Order> orders;

  const OrderState({
    required this.status,
    required this.orders,
  });

  @override
  List<Object?> get props => [status, orders];

  OrderState copyWith({
    OrderStatus? status,
    List<Order>? orders,
  }) {
    return OrderState(
      status: status ?? this.status,
      orders: orders ?? this.orders,
    );
  }
}

enum OrderStatus {
  initial,
  loading,
  getSuccess,
  getError,
}
