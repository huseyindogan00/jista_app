import 'package:jista/global/global_variable.dart';
import 'package:jista/models/service_result_model/firebase_service_result_model.dart';
import 'package:jista/models/entities_model/user_model.dart';
import 'package:jista/core/services/firebase_service.dart';

class EntryViewModel {
  static final _firebaseService = locator<FirebaseService>();

  static Future<FirebaseServiceResultModel> login(UserModel userModel) async {
    return await _firebaseService.login(userModel);
  }
}
