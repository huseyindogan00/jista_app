import 'package:firebase_auth/firebase_auth.dart';
import 'package:jista/models/entities_model/user_model.dart';

abstract class ServiceInterface {
  save(UserModel userModel);
  update(UserModel userModel);
  delete(UserModel userModel);
  isEmailVerified(User user);
  login(UserModel userModel);
}
