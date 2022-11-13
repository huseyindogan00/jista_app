import 'package:jista/core/services/service/base/i_service.dart';
import '../../../../product/models/person/person_model.dart';

abstract class IFirebaseAuthService implements IService {
  isEmailVerified(PersonModel person);
  login(PersonModel personModel);
  updatePerson(PersonModel personModel);
}
