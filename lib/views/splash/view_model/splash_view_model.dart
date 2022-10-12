import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/route_manager.dart';
import 'package:jista/core/router/auto_router/router.gr.dart';
import 'package:jista/core/router/route_name.dart';
import 'package:jista/core/services/service/firebase_store_service.dart';
import 'package:jista/core/services/service/hive_service.dart';
import 'package:jista/core/services/service_result/base/service_result.dart';
import 'package:jista/core/services/service_result/firebase_service_result_model.dart';
import 'package:jista/product/models/person/person_model.dart';

import '../../../main.dart';

class SplashViewModel {
  static final _firebaseService = locator<FirebaseStoreService>();

  static route(BuildContext context) {
    var box = locator<HiveService>();

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        // userBox kutusunun daha önce olup olmadığını sorguluyoruz.
        // Varsa Home sayfasın yoksa Entry sayfasına yönlendirme yapıcaz.
        bool isPerson = box.isPersonBox();
        await Future.delayed(const Duration(seconds: 2));
        if (isPerson) {
          final ServiceResult result =
              FirebaseServiceResultModel(isSuccess: true);
          result.data = box.getBox('person');
          context.router.replace(BaseTabsRoute(
            personModel: result,
          ));
        } else {
          context.router.replace(EntryRoute());
          //Navigator.pushReplacementNamed(context, RouteName.entryView);
        }
      },
    );
  }
}
