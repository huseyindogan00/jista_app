import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:jista/core/services/service_result/firebase_service_result_model.dart';
import 'package:jista/core/services/service/firebase_auth_service.dart';
import 'package:jista/core/utility/internet_connection_control.dart';
import '../../../main.dart';
import '../../../product/models/person/person_model.dart';

class RegisterViewModel {
  static final _firebaseAuthService = locator<FirebaseAuthService>();

  static Future<FirebaseServiceResultModel> savePerson(PersonModel personModel) async {
    return await _firebaseAuthService.update(personModel);
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