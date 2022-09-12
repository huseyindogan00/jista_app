// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:jista/models/order/order_model.dart';

import '../address/address_model.dart';

class PersonModel {
  dynamic id;
  String password;
  String name;
  String lastName;
  String rank;
  String? gender;
  AddressModel? address;
  double totalPoint;
  String duty;
  OrderModel? order;
  PersonModel({
    this.id,
    required this.password,
    required this.name,
    required this.lastName,
    required this.rank,
    this.gender,
    required this.address,
    required this.totalPoint,
    required this.duty,
    this.order,
  });

  PersonModel copyWith({
    String? id,
    String? password,
    String? name,
    String? lastName,
    String? rank,
    String? gender,
    AddressModel? address,
    double? totalPoint,
    String? duty,
    OrderModel? order,
  }) {
    return PersonModel(
      id: id ?? this.id,
      password: password ?? this.password,
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      rank: rank ?? this.rank,
      gender: gender ?? this.gender,
      address: address ?? this.address,
      totalPoint: totalPoint ?? this.totalPoint,
      duty: duty ?? this.duty,
      order: order ?? this.order,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      //'id': id,
      'password': password,
      'name': name,
      'lastName': lastName,
      'rank': rank,
      'gender': gender,
      'address': address?.toMap(),
      'totalPoint': totalPoint,
      'duty': duty,
      'order': order?.toMap(),
    };
  }

  factory PersonModel.fromMap(Map<String, dynamic> map) {
    return PersonModel(
      id: map['id'] != null ? map['id'] as String : null,
      password: map['password'] as String,
      name: map['name'] as String,
      lastName: map['lastName'] as String,
      rank: map['rank'] as String,
      gender: map['gender'] != null ? map['gender'] as String : null,
      address: AddressModel.fromMap(map['address'] as Map<String, dynamic>),
      totalPoint: map['totalPoint'] as double,
      duty: map['duty'] as String,
      order: map['order'] != null
          ? OrderModel.fromMap(map['order'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PersonModel.fromJson(String source) =>
      PersonModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PersonModel(id: $id, password: $password, name: $name, lastName: $lastName, rank: $rank, gender: $gender, address: $address, totalPoint: $totalPoint, duty: $duty, order: $order)';
  }

  @override
  bool operator ==(covariant PersonModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.password == password &&
        other.name == name &&
        other.lastName == lastName &&
        other.rank == rank &&
        other.gender == gender &&
        other.address == address &&
        other.totalPoint == totalPoint &&
        other.duty == duty &&
        other.order == order;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        password.hashCode ^
        name.hashCode ^
        lastName.hashCode ^
        rank.hashCode ^
        gender.hashCode ^
        address.hashCode ^
        totalPoint.hashCode ^
        duty.hashCode ^
        order.hashCode;
  }
}
