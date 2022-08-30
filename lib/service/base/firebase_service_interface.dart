import 'package:jista/model/user_model.dart';

abstract class FirebaseServiceInterface {
  save(UserModel userModel);
  update(UserModel userModel);
  delete(UserModel userModel);
}
