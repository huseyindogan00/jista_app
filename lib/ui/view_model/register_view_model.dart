import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:jista/global/global_variable.dart';
import 'package:jista/models/service_result_model/firebase_service_result_model.dart';
import 'package:jista/models/entities_model/user_model.dart';
import 'package:jista/core/services/firebase_service.dart';
import 'package:jista/core/utility/internet_connection_control.dart';

class RegisterViewModel {
  static final _firebaseService = locator<FirebaseService>();

  static Future<FirebaseServiceResultModel> saveUser(UserModel userModel) async {
    return await _firebaseService.save(userModel);
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
