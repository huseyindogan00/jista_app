import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jista/core/router/auto_router/router.gr.dart';
import 'package:jista/core/services/service/firebase_auth_service.dart';
import 'package:jista/core/services/service/firebase_store_service.dart';
import 'package:jista/core/services/service/hive_service.dart';
import 'package:jista/data/data_model/entities/cities.dart';
import 'package:jista/main.dart';
import 'package:jista/product/models/address/address_model.dart';
import 'package:jista/product/models/order/order_model.dart';
import 'package:jista/product/models/person/person_model.dart';
import 'package:jista/product/models/product/product_model.dart';

GetIt locator = GetIt.instance;

class AppInit {
  AppInit._private();

  // KULLANILACAK OBJELERİN SINGLE OLMASINI GARANTİ EDİYORUZ
  static void setupLocator() {
    locator.registerLazySingleton(() => FirebaseAuthService());
    locator.registerLazySingleton(() => FirebaseStoreService());
    locator.registerLazySingleton(() => HiveService());
    locator.registerLazySingleton(() => Cities());
    locator.registerLazySingleton<AutoRouter>(() => AutoRouter());
  }

// UYARI PENCERESİNİN AYARLARI YAPILIYOR
  static void easyloadingConfig() {
    EasyLoading.instance
      ..dismissOnTap = true
      ..indicatorType = EasyLoadingIndicatorType.circle
      ..indicatorColor = Colors.green
      ..maskType = EasyLoadingMaskType.black;
  }

// HİVE OLUŞTURULUYOR
  static Future<void> setupHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter<PersonModel>(PersonModelAdapter());
    Hive.registerAdapter<AddressModel>(AddressModelAdapter());
    Hive.registerAdapter<OrderModel>(OrderModelAdapter());
    Hive.registerAdapter<ProductModel>(ProductModelAdapter());

    await Hive.openBox<PersonModel>('personBox');
  }
}
