import 'package:jista/core/services/service/base/i_service.dart';

import '../../../../product/models/person/person_model.dart';

abstract class IFirebaseStoreService implements IService {
  getToCategory(String type);
  getAllCategory(String collectionName);
  loginControl(PersonModel personModel);
}
