import 'package:hive_flutter/hive_flutter.dart';
import 'package:jista/core/services/service/hive_service.dart';
import 'package:jista/core/services/service_result/base/service_result.dart';

import '../../../core/services/service/firebase_store_service.dart';
import '../../../main.dart';
import '../../../product/models/person/person_model.dart';

class EntryViewModel {
  static final _firebaseStorageService = locator<FirebaseStoreService>();

  //static final _firebaseAuthService = locator<FirebaseAuthService>();

  static Future<ServiceResult> login(PersonModel personModel) async {
    ServiceResult<PersonModel> result = await _firebaseStorageService.loginControl(personModel);
    var box = locator<HiveService>();
    /* 
         KULLANICI GİRİŞ YAPTIYSA, KULLANICIYI TELEFONUNA KAYDEDİYOR
         BİR SONRAKİ GİRİŞİNDE DİREK HOME SAYFASINA YÖNLENDİRECEK.
         EĞER GİRİŞ YAPIP OTURUMU KAPATMA DURUMUNA GÖRE LOCAL DATABASE KONTROL EDİLİYOR 
    */
    if (result.isSuccess && result.data?.id != null) {
      if (result.data?.password == personModel.password) {
        bool isPerson = await box.isPersonBox();
        if (!isPerson) {
          HiveService().saveBoxPerson(result.data!);
          return result;
        }
      } else {
        result.isSuccess = false;
        result.dataInfo = 'Şifre hatalı';

        return result;
      }
    }
    return result;
  }
}
