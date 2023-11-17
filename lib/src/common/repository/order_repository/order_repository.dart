import 'package:admin_jewellery_app/src/common/models/order_model.dart';

abstract interface class OrderRepository {
  Future<List<Order>?> getOrders();
}