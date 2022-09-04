import 'package:jista/global/global_variable.dart';
import 'package:jista/model/service_result.dart';
import 'package:jista/model/entities/user_model.dart';
import 'package:jista/services/firebase_service.dart';

class EntryViewModel {
  static final _firebaseService = locator<FirebaseService>();

  static Future<ServiceResult> login(UserModel userModel) async {
    return await _firebaseService.login(userModel);
  }
}
