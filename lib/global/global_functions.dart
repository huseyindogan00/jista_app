import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:jista/global/global_variable.dart';
import 'package:jista/data/entities/cities.dart';
import 'package:jista/core/services/firebase_service.dart';

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
