import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:jista/model/user_model.dart';
import 'package:jista/service/firebase_service.dart';
import 'package:jista/utility/internet_connection_control.dart';

class RegisterViewModel {
  static final FirebaseService _firebaseService = FirebaseService();

  static Future<bool> saveUser(
      UserModel userModel, BuildContext context) async {
    return await _firebaseService.save(userModel, context);
  }

  // CİHAZI İNTERNETE BAĞLAYAN UÇLARI AÇIK OLSA DAHİ İNTERNET
  // BAĞLANTISININ SAĞLANIP SAĞLANMADIĞINI KONTROL EDER
  static Future<bool> isDeviceConnected() async {
    bool isDeviceConnected = await InternetConnectionChecker().hasConnection;
    return isDeviceConnected;
  }

  // BU METHOD CİHAZI İNTERNETE BAĞLAYAN WİFİ, MOBİL VERİ VS OLAN UÇLARINI KONTROL EDER
  static Future<bool> internetControl() async {
    bool hasDeviceConnected = await isDeviceConnected();
    if (hasDeviceConnected) {
      InternetConnectionControl connection = InternetConnectionControl();
      ConnectivityResult status = await connection.connectionStatus();
      if (status != ConnectivityResult.none) {
        return true;
      }
    }
    return false;
  }
}
