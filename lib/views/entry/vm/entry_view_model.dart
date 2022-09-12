import 'package:firebase_auth/firebase_auth.dart';
import 'package:jista/core/services/service/hive_service.dart';
import 'package:jista/core/services/service_result/base/service_result.dart';
import 'package:jista/core/services/service_result/firebase_service_result_model.dart';
import 'package:jista/models/person/person_model.dart';

import '../../../core/services/service/firebase_auth_service.dart';
import '../../../core/services/service/firebase_store_service.dart';
import '../../../main.dart';
import '../../../models/user/user_model.dart';

class EntryViewModel {
  static final _firebaseStorageService = locator<FirebaseStoreService>();
  //static final _firebaseAuthService = locator<FirebaseAuthService>();

  static Future<ServiceResult> login(UserModel userModel) async {
    ServiceResult<List<PersonModel>> result = await _firebaseStorageService.login(userModel);

    PersonModel personModel = result.data!.first;

    /* KULLANICI GİRİŞ YAPTIYSA, KULLANICIYI TELEFONUNA KAYDEDİYOR
         BİR SONRAKİ GİRİŞİNDE DİREK HOME SAYFASINA YÖNLENDİRECEK. */
    if (result.isSuccess && personModel.id != null) {
      HiveService().saveUser(personModel);
    }

    return result;
  }
}
