// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:jista/product/models/product/product_model.dart';

class CartModel {
  String? id;
  ProductModel productModel;
  CartModel({
    this.id,
    required this.productModel,
  });

  CartModel copyWith({
    String? id,
    ProductModel? productModel,
  }) {
    return CartModel(
      id: id ?? this.id,
      productModel: productModel ?? this.productModel,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'productModel': productModel.toMap(),
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      id: map['id'] != null ? map['id'] as String : null,
      productModel: ProductModel.fromMap(map['productModel'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory CartModel.fromJson(String source) => CartModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CartModel(id: $id, productModel: $productModel)';

  @override
  bool operator ==(covariant CartModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.productModel == productModel;
  }

  @override
  int get hashCode => id.hashCode ^ productModel.hashCode;
}
