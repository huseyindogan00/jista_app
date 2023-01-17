// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:jista/core/init/app_init.dart';
import 'core/router/auto_router/router.gr.dart';

// SİNGLE OBJECT OLUŞTURUCU

// FLOATİN ACTIN BUTTON - BUBBLE ANIMATION
/* late Animation<double> animation;
late AnimationController animationController; */

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  await Firebase.initializeApp();

  await AppInit.setupHive();
  AppInit.setupLocator();
  AppInit.easyloadingConfig();

  final _appRouter = locator<AutoRouter>();

  runApp(
    MaterialApp.router(
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      title: 'JİSTA',
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    ),
  );
}
