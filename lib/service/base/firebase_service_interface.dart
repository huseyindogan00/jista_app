import 'package:flutter/cupertino.dart';
import 'package:jista/model/user_model.dart';

abstract class FirebaseServiceInterface {
  save(UserModel userModel, BuildContext context);
  update(UserModel userModel);
  delete(UserModel userModel);
}
