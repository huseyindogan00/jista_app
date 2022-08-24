import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:jista/model/user_model.dart';
import 'package:jista/service/firebase_service.dart';
import 'package:jista/utility/internet_connection_status.dart';

class RegisterViewModel {
  static final FirebaseService _firebaseService = FirebaseService();

  static Future<bool> saveUser(
      UserModel userModel, BuildContext context) async {
    return await _firebaseService.save(userModel, context);
  }

  static Future<bool> internetControl() async {
    InternetConnectionStatus connection = InternetConnectionStatus();
    ConnectivityResult status = await connection.connectionStatus();
    print('*********************internetControl değeri : $status');

    if (status == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }
}
