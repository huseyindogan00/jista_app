import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jista/models/user/user_model.dart';

class HiveService {
  static String _boxName = 'userBox';
  late Box<UserModel> box;

  HiveService() {
    box = Hive.box<UserModel>(_boxName);
  }

  getBox(String boxName) {}

  saveUser(UserModel userModel) async {
    await box.put('user', userModel);
    print(box.get('user'));
  }

  deleteUserBox(String boxName) async {
    await Hive.deleteBoxFromDisk(boxName);
  }

  bool isUserBox() {
    var userBox = Hive.box<UserModel>('userBox');
    var userModel = userBox.get('user');
    print(userModel);

    return userModel == null ? false : true;
  }
}
