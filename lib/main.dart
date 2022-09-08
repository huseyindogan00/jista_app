import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:jista/core/theme/theme_app.dart';
import 'package:jista/global/global_functions.dart';
import 'package:jista/core/router/route_generator.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  FlutterNativeSplash.remove();
  runApp(JIsTaApp());
}

class JIsTaApp extends StatelessWidget {
  JIsTaApp({Key? key}) : super(key: key) {
    easyloadingConfig();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      darkTheme: ThemeData.dark(),
      theme: ThemeApp.themeData,
      debugShowCheckedModeBanner: false,
      title: 'Jandarma İstihkak Talep',
      onGenerateRoute: RouteGenerator.routeGenerator,
      //home: EntryPage(),
      builder: EasyLoading.init(),
    );
  }
}
