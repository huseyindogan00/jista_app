import 'package:firebase_auth/firebase_auth.dart';
import 'package:jista/model/entities/user_model.dart';

abstract class FirebaseServiceInterface {
  save(UserModel userModel);
  update(UserModel userModel);
  delete(UserModel userModel);
  isEmailVerified(User user);
  login(UserModel userModel);
}
