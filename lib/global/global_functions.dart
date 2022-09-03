import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:jista/global/global_variable.dart';
import 'package:jista/model/data_entities/cities.dart';
import 'package:jista/service/firebase_service.dart';

setupLocator() {
  locator.registerLazySingleton(() => FirebaseService());
  locator.registerLazySingleton(() => Cities());
}

void easyloadingConfig() {
  EasyLoading.instance
    ..dismissOnTap = true
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..maskType = EasyLoadingMaskType.black;
}
