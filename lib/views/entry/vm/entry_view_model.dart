import 'package:jista/core/services/service/hive_service.dart';
import 'package:jista/core/services/service_result/base/service_result.dart';
import 'package:jista/core/services/service_result/firebase_service_result_model.dart';

import '../../../core/services/service/firebase_store_service.dart';
import '../../../main.dart';
import '../../../models/user/user_model.dart';

class EntryViewModel {
  static final _firebaseAuthService = locator<FirebaseStoreService>();

  static Future<ServiceResult> login(UserModel userModel) async {
    ServiceResult result = await _firebaseAuthService.login(userModel);
    /* KULLANICI GİRİŞ YAPTIYSA, KULLANICIYI TELEFONUNA KAYDEDİYORU.
    BİR SONRAKİ GİRİŞİNDE DİREK HOME SAYFASINA YÖNLENDİRECEK. */
    result.isSuccess ? HiveService().saveUser(userModel) : '';

    return result;
  }
}
