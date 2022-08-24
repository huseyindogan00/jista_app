class UserModel {
  int? id;
  String? name;
  String? email;
  String? password;

  UserModel({this.name, this.email, this.password});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    return data;
  }

  @override
  String toString() {
    return 'name: $name email: $email password: $password';
  }
}
