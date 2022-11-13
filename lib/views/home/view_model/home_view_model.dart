// ignore_for_file: unused_field

import 'package:jista/core/services/service/firebase_store_service.dart';
import 'package:jista/main.dart';
import 'package:jista/views/base/base_model.dart';

class HomeViewModel extends BaseModel {
  static final _firebaseStorage = locator<FirebaseStoreService>();
}
