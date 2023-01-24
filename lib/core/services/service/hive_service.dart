import 'package:hive_flutter/hive_flutter.dart';

import '../../../product/models/person/person_model.dart';

class HiveService {
  final String _personBoxName = 'personBox';
  late Box<PersonModel> _personBox;

  _openBoxPerson() async {
    await Hive.openBox<PersonModel>(_personBoxName);
    _personBox = Hive.box<PersonModel>(_personBoxName);
  }

  Future<bool> isPersonBox() async {
    await _openBoxPerson();
    bool result = _personBox.values.isNotEmpty;

    return result;
  }

  Future<PersonModel?> getBoxPerson(String boxName) async {
    await _openBoxPerson();
    return _personBox.get(boxName);
  }

  Future<String> getBoxPersonId() async {
    _openBoxPerson();
    PersonModel? personModel = _personBox.get('person');
    return personModel?.id;
  }

  void saveBoxPerson(PersonModel personModel) async {
    await _openBoxPerson();
    await _personBox.put('person', personModel);
  }

  void deleteUserBoxPerson(String boxName) async {
    await Hive.deleteBoxFromDisk(boxName);
  }
}
