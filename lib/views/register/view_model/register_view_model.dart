import 'package:jista/core/init/app_init.dart';
import 'package:jista/core/services/service_result/firebase_service_result_model.dart';
import 'package:jista/core/services/service/firebase_auth_service.dart';
import 'package:jista/views/base/base_model.dart';
import '../../../main.dart';
import '../../../product/models/person/person_model.dart';

class RegisterViewModel extends BaseModel {
  static final _firebaseAuthService = locator<FirebaseAuthService>();

  static Future<FirebaseServiceResultModel> savePerson(PersonModel personModel) async {
    return await _firebaseAuthService.updatePerson(personModel);
  }
}
