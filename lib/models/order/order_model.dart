// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:jista/models/person/person_model.dart';

import '../product/product_model.dart';

part 'order_model.g.dart';

@HiveType(typeId: 3)
class OrderModel {
  @HiveField(0)
  dynamic id;
  @HiveField(1)
  ProductModel productModel;
  @HiveField(2)
  DateTime dateTime;
  OrderModel({
    required this.id,
    required this.productModel,
    required this.dateTime,
  });

  OrderModel copyWith({
    dynamic? id,
    ProductModel? productModel,
    DateTime? dateTime,
  }) {
    return OrderModel(
      id: id ?? this.id,
      productModel: productModel ?? this.productModel,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'productModel': productModel.toMap(),
      'dateTime': dateTime.millisecondsSinceEpoch,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'] as dynamic,
      productModel: ProductModel.fromMap(map['productModel'] as Map<String, dynamic>),
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) => OrderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'OrderModel(id: $id, productModel: $productModel, dateTime: $dateTime)';

  @override
  bool operator ==(covariant OrderModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.productModel == productModel && other.dateTime == dateTime;
  }

  @override
  int get hashCode => id.hashCode ^ productModel.hashCode ^ dateTime.hashCode;
}
