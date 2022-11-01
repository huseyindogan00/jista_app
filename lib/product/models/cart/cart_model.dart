// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:jista/product/models/product/product_model.dart';

class CartModel {
  String? id;
  ProductModel productModel;
  int count;
  String size;
  CartModel({
    this.id,
    required this.productModel,
    required this.count,
    required this.size,
  });

  CartModel copyWith({
    String? id,
    ProductModel? productModel,
    int? count,
    String? size,
  }) {
    return CartModel(
      id: id ?? this.id,
      productModel: productModel ?? this.productModel,
      count: count ?? this.count,
      size: size ?? this.size,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'productModel': productModel.toMap(),
      'count': count,
      'size': size,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      id: map['id'] != null ? map['id'] as String : null,
      productModel: ProductModel.fromMap(map['productModel'] as Map<String, dynamic>),
      count: map['count'] as int,
      size: map['size'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartModel.fromJson(String source) => CartModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CartModel(id: $id, productModel: $productModel, count: $count, size: $size)';
  }

  @override
  bool operator ==(covariant CartModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.productModel == productModel && other.count == count && other.size == size;
  }

  @override
  int get hashCode {
    return id.hashCode ^ productModel.hashCode ^ count.hashCode ^ size.hashCode;
  }
}
