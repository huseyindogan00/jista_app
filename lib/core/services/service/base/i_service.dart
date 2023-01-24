import '../../../../product/models/person/person_model.dart';

abstract class IService {
  delete(PersonModel personModel);
  create(PersonModel personModel);
}
