// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AddressModel {
  dynamic id;
  String city;
  String town;
  String telephoneNumber;
  String mobileTelephoneNumber;
  String fullAddress;
  String postCode;
  AddressModel({
    required this.id,
    required this.city,
    required this.town,
    required this.telephoneNumber,
    required this.mobileTelephoneNumber,
    required this.fullAddress,
    required this.postCode,
  });

  AddressModel copyWith({
    dynamic id,
    String? city,
    String? town,
    String? telephoneNumber,
    String? mobileTelephoneNumber,
    String? fullAddress,
    String? postCode,
  }) {
    return AddressModel(
      id: id ?? this.id,
      city: city ?? this.city,
      town: town ?? this.town,
      telephoneNumber: telephoneNumber ?? this.telephoneNumber,
      mobileTelephoneNumber: mobileTelephoneNumber ?? this.mobileTelephoneNumber,
      fullAddress: fullAddress ?? this.fullAddress,
      postCode: postCode ?? this.postCode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      //'id': id,
      'city': city,
      'town': town,
      'telephoneNumber': telephoneNumber,
      'mobileTelephoneNumber': mobileTelephoneNumber,
      'fullAddress': fullAddress,
      'postCode': postCode,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      id: map['id'] as dynamic,
      city: map['city'] as String,
      town: map['town'] as String,
      telephoneNumber: map['telephoneNumber'] as String,
      mobileTelephoneNumber: map['mobileTelephoneNumber'] as String,
      fullAddress: map['fullAddress'] as String,
      postCode: map['postCode'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) => AddressModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AddressModel(id: $id, city: $city, town: $town, telephoneNumber: $telephoneNumber, mobileTelephoneNumber: $mobileTelephoneNumber, fullAddress: $fullAddress, postCode: $postCode)';
  }

  @override
  bool operator ==(covariant AddressModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.city == city &&
        other.town == town &&
        other.telephoneNumber == telephoneNumber &&
        other.mobileTelephoneNumber == mobileTelephoneNumber &&
        other.fullAddress == fullAddress &&
        other.postCode == postCode;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        city.hashCode ^
        town.hashCode ^
        telephoneNumber.hashCode ^
        mobileTelephoneNumber.hashCode ^
        fullAddress.hashCode ^
        postCode.hashCode;
  }
}
