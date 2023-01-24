import 'package:jista/core/services/service/base/i_service.dart';
import 'package:jista/product/models/address/address_model.dart';

import '../../../../product/models/person/person_model.dart';

abstract class IFirebaseStoreService implements IService {
  getAllProduct(String typeName);
  loginControl(PersonModel personModel);
  getFilterProducts(String season, String typeName);
  updateAddress(String personId, AddressModel addressModel);
}
