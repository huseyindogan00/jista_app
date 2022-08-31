import 'package:jista/global/global_variable.dart';
import 'package:jista/model/data_entities/cities.dart';
import 'package:jista/service/firebase_service.dart';

setupLocator() {
  locator.registerLazySingleton(() => FirebaseService());
  locator.registerLazySingleton(() => Cities());
}
