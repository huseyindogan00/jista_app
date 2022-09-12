import 'package:firebase_auth/firebase_auth.dart';
import 'package:jista/core/services/service/base/i_service.dart';

import '../../../../models/user/user_model.dart';

abstract class IFirebaseAuthService implements IService {
  isEmailVerified(User user);
}