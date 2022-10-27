// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive_flutter/adapters.dart';

part 'product_model.g.dart';

@HiveType(typeId: 2)
class ProductModel {
  static List<ProductModel>? productList;

  @HiveField(0)
  dynamic id;
  @HiveField(1)
  String type;
  @HiveField(2)
  String title;
  @HiveField(3)
  String rank;
  @HiveField(4)
  String season;
  @HiveField(5)
  String gender;
  @HiveField(6)
  bool cargoStatus;
  @HiveField(7)
  int quantity;
  @HiveField(8)
  int point;
  @HiveField(9)
  String? imageUrl;
  ProductModel({
    required this.id,
    required this.type,
    required this.title,
    required this.rank,
    required this.season,
    required this.gender,
    required this.cargoStatus,
    required this.quantity,
    required this.point,
    required this.imageUrl,
  });

  ProductModel copyWith({
    dynamic id,
    String? type,
    String? title,
    String? rank,
    String? season,
    String? gender,
    bool? cargoStatus,
    int? quantity,
    int? point,
    String? imageUrl,
  }) {
    return ProductModel(
      id: id ?? this.id,
      type: type ?? this.type,
      title: title ?? this.title,
      rank: rank ?? this.rank,
      season: season ?? this.season,
      gender: gender ?? this.gender,
      cargoStatus: cargoStatus ?? this.cargoStatus,
      quantity: quantity ?? this.quantity,
      point: point ?? this.point,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'type': type,
      'title': title,
      'rank': rank,
      'season': season,
      'gender': gender,
      'cargoStatus': cargoStatus,
      'quantity': quantity,
      'point': point,
      'imageUrl': imageUrl,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as dynamic,
      type: map['type'] as String,
      title: map['title'] as String,
      rank: map['rank'] as String,
      season: map['season'] as String,
      gender: map['gender'] as String,
      cargoStatus: map['cargoStatus'] as bool,
      quantity: map['quantity'] as int,
      point: map['point'] as int,
      imageUrl: map['imageUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductModel(id: $id, type: $type, title: $title, rank: $rank, season: $season, gender: $gender, cargoStatus: $cargoStatus, quantity: $quantity, point: $point, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.type == type &&
        other.title == title &&
        other.rank == rank &&
        other.season == season &&
        other.gender == gender &&
        other.cargoStatus == cargoStatus &&
        other.quantity == quantity &&
        other.point == point &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        type.hashCode ^
        title.hashCode ^
        rank.hashCode ^
        season.hashCode ^
        gender.hashCode ^
        cargoStatus.hashCode ^
        quantity.hashCode ^
        point.hashCode ^
        imageUrl.hashCode;
  }
}
