import 'dart:convert';

import 'package:admin_jewellery_app/src/common/models/order_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../folder.dart';
import 'order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final FirebaseDatabase _db;

  OrderRepositoryImpl() : _db = FirebaseDatabase.instance;

  @override
  Future<List<Order>?> getOrders() async {
    try {
      final result = await _db.ref("").child(Folder.orders.name).get();
      List<Order> data = result.children
          .map((e) => Order.fromJson(jsonDecode(jsonEncode(e.value))))
          .toList();

      return data;
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      return null;
    }
  }
}
