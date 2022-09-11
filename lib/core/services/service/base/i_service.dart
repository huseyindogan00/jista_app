import 'package:firebase_auth/firebase_auth.dart';

import '../../../../models/user/user_model.dart';

abstract class IService {
  update(UserModel userModel);
  delete(UserModel model);
  read(String userId);
  create(UserModel model);
  login(UserModel userModel);
}
