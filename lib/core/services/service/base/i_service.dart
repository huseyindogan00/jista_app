import 'package:firebase_auth/firebase_auth.dart';
import 'package:jista/product/models/address/address_model.dart';
import '../../../../product/models/person/person_model.dart';

abstract class IService {
  delete(PersonModel personModel);
  create(PersonModel personModel);
}
