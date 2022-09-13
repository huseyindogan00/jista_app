import 'package:firebase_auth/firebase_auth.dart';
import 'package:jista/core/services/service/hive_service.dart';
import 'package:jista/core/services/service_result/base/service_result.dart';
import 'package:jista/core/services/service_result/firebase_service_result_model.dart';

import '../../../core/services/service/firebase_auth_service.dart';
import '../../../core/services/service/firebase_store_service.dart';
import '../../../main.dart';
import '../../../models/person/person_model.dart';

class EntryViewModel {
  static final _firebaseStorageService = locator<FirebaseStoreService>();
  //static final _firebaseAuthService = locator<FirebaseAuthService>();

  static Future<ServiceResult> login(PersonModel personModel) async {
    ServiceResult<List<PersonModel>> result =
        await _firebaseStorageService.login(personModel);

    PersonModel person = result.data!.first;

    /* KULLANICI GİRİŞ YAPTIYSA, KULLANICIYI TELEFONUNA KAYDEDİYOR
         BİR SONRAKİ GİRİŞİNDE DİREK HOME SAYFASINA YÖNLENDİRECEK. */
    if (result.isSuccess && person.id != null) {
      HiveService().savePerson(person);
    }

    return result;
  }
}
