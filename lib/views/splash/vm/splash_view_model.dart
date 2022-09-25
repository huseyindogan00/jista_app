import 'package:flutter/cupertino.dart';
import 'package:get/route_manager.dart';
import 'package:jista/core/router/route_name.dart';
import 'package:jista/core/services/service/firebase_store_service.dart';
import 'package:jista/core/services/service/hive_service.dart';
import 'package:jista/product/models/person/person_model.dart';

import '../../../main.dart';

class SplashViewModel {
  static final _firebaseService = locator<FirebaseStoreService>();

  static route(BuildContext context) {
    var box = locator<HiveService>();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        // userBox kutusunun daha önce olup olmadığını sorguluyoruz.
        // Varsa Home sayfasın yoksa Entry sayfasına yönlendirme yapıcaz.
        bool isPerson = box.isPersonBox();
        if (isPerson) {
          final personModel = box.getBox('person');
          Get.offAndToNamed(RouteName.mainView, arguments: personModel);
          //Navigator.pushReplacementNamed(context, RouteName.homeView);
        } else {
          Get.offAndToNamed(RouteName.entryView);
          //Navigator.pushReplacementNamed(context, RouteName.entryView);
        }
      },
    );
  }
}
