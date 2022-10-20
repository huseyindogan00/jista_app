// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive_flutter/adapters.dart';

import '../product/product_model.dart';

part 'order_model.g.dart';

@HiveType(typeId: 3)
class OrderModel {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String productId;
  @HiveField(2)
  DateTime dateTime;
  OrderModel({
    this.id,
    required this.productId,
    required this.dateTime,
  });

  OrderModel copyWith({
    String? id,
    String? productId,
    DateTime? dateTime,
  }) {
    return OrderModel(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'productId': productId,
      'dateTime': dateTime.millisecondsSinceEpoch,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'] != null ? map['id'] as String : null,
      productId: map['productId'] as String,
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) => OrderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'OrderModel(id: $id, productId: $productId, dateTime: $dateTime)';

  @override
  bool operator ==(covariant OrderModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.productId == productId && other.dateTime == dateTime;
  }

  @override
  int get hashCode => id.hashCode ^ productId.hashCode ^ dateTime.hashCode;
}
