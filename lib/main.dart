import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:jista/global/global_functions.dart';
import 'package:jista/utility/route_generator.dart';
import 'package:jista/view/entry_page.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  runApp(JIsTaApp());
}

class JIsTaApp extends StatelessWidget {
  JIsTaApp({Key? key}) : super(key: key) {
    easyloadingConfig();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jandarma İstihkak Talep',
      onGenerateRoute: RouteGenerator.routeGenerator,
      home: EntryPage(),
      builder: EasyLoading.init(),
    );
  }
}
