import 'package:flutter/material.dart';
import 'package:jista/core/init/app_init.dart';
import 'package:jista/core/services/service/firebase_store_service.dart';
import 'package:jista/core/services/service/hive_service.dart';
import 'package:jista/core/services/service_result/base/service_result.dart';
import 'package:jista/product/models/person/person_model.dart';

class EntryViewModel with ChangeNotifier {
  final _firebaseStorageService = locator<FirebaseStoreService>();

  bool _isloading = false;

  bool get isloading => _isloading;
  set isloading(bool loading) {
    _isloading = loading;
    notifyListeners();
  }

  Future<ServiceResult> login(PersonModel personModel) async {
    isloading = true;
    ServiceResult<PersonModel> result = await _firebaseStorageService.loginControl(personModel);
    var box = locator<HiveService>();
    /* 
         KULLANICI GİRİŞ YAPTIYSA, KULLANICIYI TELEFONUNA KAYDEDİYOR
         BİR SONRAKİ GİRİŞİNDE DİREK HOME SAYFASINA YÖNLENDİRECEK.
         GİRİŞ YAPIP OTURUMU KAPATMA DURUMUNA GÖRE LOCAL DATABASE KONTROL EDİLİYOR 
    */
    if (result.isSuccess && result.data?.id != null) {
      if (result.data?.password == personModel.password) {
        bool isPerson = await box.isPersonBox();
        if (!isPerson) {
          HiveService().saveBoxPerson(result.data!);
        }
      } else {
        result.isSuccess = false;
        result.dataInfo = 'Şifre hatalı';
      }
    }
    isloading = false;
    return result;
  }
}
