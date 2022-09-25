import 'package:firebase_auth/firebase_auth.dart';
import '../../../../product/models/person/person_model.dart';

abstract class IService {
  update(PersonModel personModel);
  delete(PersonModel personModel);
  read(String personId);
  create(PersonModel personModel);
  login(PersonModel personModel);
}
