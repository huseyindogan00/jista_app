import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jista/core/services/service/firebase_auth_service.dart';
import 'package:jista/core/services/service/firebase_store_service.dart';
import 'package:jista/core/services/service/hive_service.dart';
import 'package:jista/data/data_model/entities/cities.dart';
import 'package:jista/core/router/route_generator.dart';
import 'package:jista/models/user/user_model.dart';
import 'package:jista/views/splash/view/splash_view.dart';

import 'common/theme/theme_app.dart';

// SİNGLE OBJECT OLUŞTURUCU
GetIt locator = GetIt.instance;

// TEMA BİLGİSİ
bool darkTheme = false;

// FLOATİN ACTIN BUTTON - BUBBLE ANIMATION
late Animation<double> animation;
late AnimationController animationController;

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  await setupHive();
  easyloadingConfig();
  //FlutterNativeSplash.remove();
  runApp(JIsTaApp());
}

class JIsTaApp extends StatelessWidget {
  JIsTaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      darkTheme: ThemeData.dark(),
      theme: ThemeApp.themeData,
      debugShowCheckedModeBanner: false,
      title: 'Jandarma İstihkak Talep',
      onGenerateRoute: RouteGenerator.routeGenerator,
      home: const SplashView(),
      builder: EasyLoading.init(),
    );
  }
}

setupLocator() {
  locator.registerLazySingleton(() => FirebaseAuthService());
  locator.registerLazySingleton(() => FirebaseStoreService());
  locator.registerLazySingleton(() => HiveService());
  locator.registerLazySingleton(() => Cities());
}

// Uyarı penceremin ayarları yapılıyor
void easyloadingConfig() {
  EasyLoading.instance
    ..dismissOnTap = true
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..maskType = EasyLoadingMaskType.black;
}

// Hive oluşturuluyor
Future<void> setupHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  await Hive.openBox<UserModel>('userBox');
}
