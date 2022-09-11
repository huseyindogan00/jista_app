// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jista/models/person/person_model.dart';

import '../product/product_model.dart';

class OrderModel {
  dynamic id;
  String year;
  PersonModel personModel;
  ProductModel productModel;
  DateTime dateTime;
  OrderModel({
    this.id,
    required this.year,
    required this.personModel,
    required this.productModel,
    required this.dateTime,
  });

  OrderModel copyWith({
    String? id,
    String? year,
    PersonModel? personModel,
    ProductModel? productModel,
    DateTime? dateTime,
  }) {
    return OrderModel(
      id: id ?? this.id,
      year: year ?? this.year,
      personModel: personModel ?? this.personModel,
      productModel: productModel ?? this.productModel,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      //'id': id,
      'year': year,
      'personModel': personModel.toMap(),
      'productModel': productModel.toMap(),
      'dateTime': FieldValue.serverTimestamp(),
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'] != null ? map['id'] as String : null,
      year: map['year'] as String,
      personModel: PersonModel.fromMap(map['personModel'] as Map<String, dynamic>),
      productModel: ProductModel.fromMap(map['productModel'] as Map<String, dynamic>),
      dateTime: (map['dateTime'] as Timestamp).toDate(),
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) => OrderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrderModel(id: $id, year: $year, personModel: $personModel, productModel: $productModel, dateTime: $dateTime)';
  }

  @override
  bool operator ==(covariant OrderModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.year == year &&
        other.personModel == personModel &&
        other.productModel == productModel &&
        other.dateTime == dateTime;
  }

  @override
  int get hashCode {
    return id.hashCode ^ year.hashCode ^ personModel.hashCode ^ productModel.hashCode ^ dateTime.hashCode;
  }
}
