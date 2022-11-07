// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive_flutter/adapters.dart';

part 'order_model.g.dart';

@HiveType(typeId: 3)
class OrderModel {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String productId;
  @HiveField(2)
  String size;
  @HiveField(3)
  bool cargo;
  @HiveField(4)
  bool count;
  @HiveField(5)
  DateTime dateTime;
  OrderModel({
    this.id,
    required this.productId,
    required this.size,
    required this.cargo,
    required this.count,
    required this.dateTime,
  });

  OrderModel copyWith({
    String? id,
    String? productId,
    String? size,
    bool? cargo,
    bool? count,
    DateTime? dateTime,
  }) {
    return OrderModel(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      size: size ?? this.size,
      cargo: cargo ?? this.cargo,
      count: count ?? this.count,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'productId': productId,
      'size': size,
      'cargo': cargo,
      'count': count,
      'dateTime': dateTime.millisecondsSinceEpoch,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'] != null ? map['id'] as String : null,
      productId: map['productId'] as String,
      size: map['size'] as String,
      cargo: map['cargo'] as bool,
      count: map['count'] as bool,
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) => OrderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrderModel(id: $id, productId: $productId, size: $size, cargo: $cargo, count: $count, dateTime: $dateTime)';
  }

  @override
  bool operator ==(covariant OrderModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.productId == productId &&
        other.size == size &&
        other.cargo == cargo &&
        other.count == count &&
        other.dateTime == dateTime;
  }

  @override
  int get hashCode {
    return id.hashCode ^ productId.hashCode ^ size.hashCode ^ cargo.hashCode ^ count.hashCode ^ dateTime.hashCode;
  }
}
