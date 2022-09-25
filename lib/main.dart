import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jista/core/router/route_name.dart';
import 'package:jista/core/services/service/firebase_auth_service.dart';
import 'package:jista/core/services/service/firebase_store_service.dart';
import 'package:jista/core/services/service/hive_service.dart';
import 'package:jista/data/data_model/entities/cities.dart';
import 'package:jista/product/models/address/address_model.dart';
import 'package:jista/product/models/order/order_model.dart';
import 'package:jista/product/models/person/person_model.dart';
import 'package:jista/product/models/product/product_model.dart';
import 'package:jista/views/splash/view/splash_view.dart';

import 'data/theme/theme_app.dart';

// SİNGLE OBJECT OLUŞTURUCU
GetIt locator = GetIt.instance;
// FLOATİN ACTIN BUTTON - BUBBLE ANIMATION
late Animation<double> animation;
late AnimationController animationController;

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  await Firebase.initializeApp();
  await setupHive();
  setupLocator();
  easyloadingConfig();

  runApp(GetMaterialApp(
      initialRoute: RouteName.splashView,
      getPages: RoutePage.pageList,
      theme: ThemeApp.themeLight,
      darkTheme: ThemeApp.themeDark,
      builder: EasyLoading.init()));
}

// KULLANILACAK OBJELERİN SINGLE OLMASINI GARANTİ EDİYORUZ
setupLocator() {
  locator.registerLazySingleton(() => FirebaseAuthService());
  locator.registerLazySingleton(() => FirebaseStoreService());
  locator.registerLazySingleton(() => HiveService());
  locator.registerLazySingleton(() => Cities());
}

// UYARI PENVERESİNİN AYARLARI YAPILIYOR
void easyloadingConfig() {
  EasyLoading.instance
    ..dismissOnTap = true
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..maskType = EasyLoadingMaskType.black;
}

// HİVE OLUŞTURULUYOR
Future<void> setupHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter<PersonModel>(PersonModelAdapter());
  Hive.registerAdapter<AddressModel>(AddressModelAdapter());
  Hive.registerAdapter<OrderModel>(OrderModelAdapter());
  Hive.registerAdapter<ProductModel>(ProductModelAdapter());

  await Hive.openBox<PersonModel>('personBox');
}
