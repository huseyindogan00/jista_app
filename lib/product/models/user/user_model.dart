import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

class UserModel extends HiveObject {
  String? id;
  String? pbik;
  String? userName;
  String? email;
  String? password;

  UserModel({
    this.id,
    this.pbik,
    this.userName,
    this.email,
    this.password,
  });

  UserModel copyWith({
    String? id,
    String? pbik,
    String? userName,
    String? email,
    String? password,
  }) {
    return UserModel(
      id: id ?? this.id,
      pbik: pbik ?? this.pbik,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'pbik': pbik,
      'userName': userName,
      'email': email,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] != null ? map['id'] as String : null,
      pbik: map['pbik'] != null ? map['pbik'] as String : null,
      userName: map['userName'] != null ? map['userName'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, pbik: $pbik, userName: $userName, email: $email, password: $password)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.pbik == pbik &&
        other.userName == userName &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode {
    return id.hashCode ^ pbik.hashCode ^ userName.hashCode ^ email.hashCode ^ password.hashCode;
  }
}
