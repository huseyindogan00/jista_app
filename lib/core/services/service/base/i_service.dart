import 'package:firebase_auth/firebase_auth.dart';
import 'package:jista/models/person/person_model.dart';

import '../../../../models/user/user_model.dart';

abstract class IService {
  update(PersonModel personModel);
  delete(PersonModel personModel);
  read(String personId);
  create(PersonModel personModel);
  login(PersonModel personModel);
}
