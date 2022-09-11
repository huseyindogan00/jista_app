import 'package:flutter/cupertino.dart';
import 'package:jista/core/router/route_name.dart';
import 'package:jista/core/services/service/firebase_store_service.dart';
import 'package:jista/core/services/service/hive_service.dart';

import '../../../main.dart';

class SplashViewModel {
  static final _firebaseService = locator<FirebaseStoreService>();

  static route(BuildContext context) {
    var box = locator<HiveService>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // userBox kutusunun daha önce olup olmadığını sorguluyoruz.
      // Varsa Home sayfasın yoksa Entry sayfasına yönlendirme yapıcaz.
      bool isUser = box.isUserBox();
      if (isUser) {
        print('home page girdi');
        Navigator.pushReplacementNamed(context, RouteName.homeView);
      } else {
        print('entry page girdi');
        Navigator.pushReplacementNamed(context, RouteName.entryView);
      }
    });
  }
}
