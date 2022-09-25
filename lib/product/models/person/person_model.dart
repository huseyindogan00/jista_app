// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive_flutter/adapters.dart';
import '../address/address_model.dart';
import '../order/order_model.dart';

part 'person_model.g.dart';

@HiveType(typeId: 1)
class PersonModel {
  @HiveField(0)
  dynamic id;
  @HiveField(1)
  String? password;
  @HiveField(2)
  String? pbik;
  @HiveField(3)
  String? email;
  @HiveField(4)
  String? name;
  @HiveField(5)
  String? lastName;
  @HiveField(6)
  String? rank;
  @HiveField(7)
  String? gender;
  @HiveField(8)
  AddressModel? address;
  @HiveField(9)
  int? totalPoint;
  @HiveField(10)
  String? duty;
  @HiveField(11)
  OrderModel? order;
  PersonModel({
    this.id,
    this.password,
    this.pbik,
    this.email,
    this.name,
    this.lastName,
    this.rank,
    this.gender,
    this.address,
    this.totalPoint,
    this.duty,
    this.order,
  });

  PersonModel copyWith({
    dynamic id,
    String? password,
    String? pbik,
    String? email,
    String? name,
    String? lastName,
    String? rank,
    String? gender,
    AddressModel? address,
    int? totalPoint,
    String? duty,
    OrderModel? order,
  }) {
    return PersonModel(
      id: id ?? this.id,
      password: password ?? this.password,
      pbik: pbik ?? this.pbik,
      email: email ?? this.email,
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
      'id': id,
      'password': password,
      'pbik': pbik,
      'email': email,
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
      id: map['id'] as dynamic,
      password: map['password'] != null ? map['password'] as String : null,
      pbik: map['pbik'] != null ? map['pbik'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
      rank: map['rank'] != null ? map['rank'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      address: map['address'] != null ? AddressModel.fromMap(map['address'] as Map<String, dynamic>) : null,
      totalPoint: map['totalPoint'] != null ? map['totalPoint'] as int : null,
      duty: map['duty'] != null ? map['duty'] as String : null,
      order: map['order'] != null ? OrderModel.fromMap(map['order'] as Map<String, dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PersonModel.fromJson(String source) => PersonModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PersonModel(id: $id, password: $password, pbik: $pbik, email: $email, name: $name, lastName: $lastName, rank: $rank, gender: $gender, address: $address, totalPoint: $totalPoint, duty: $duty, order: $order)';
  }

  @override
  bool operator ==(covariant PersonModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.password == password &&
        other.pbik == pbik &&
        other.email == email &&
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
        pbik.hashCode ^
        email.hashCode ^
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
