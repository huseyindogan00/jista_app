import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../product/models/person/person_model.dart';

class HiveService {
  static String _boxName = 'personBox';
  late Box<PersonModel> box;

  HiveService() {
    box = Hive.box<PersonModel>(_boxName);
  }

  PersonModel? getBox(String boxName) {
    return box.get(boxName);
  }

  savePerson(PersonModel personModel) async {
    await box.put('person', personModel);
  }

  deleteUserBox(String boxName) async {
    await Hive.deleteBoxFromDisk(boxName);
  }

  Future<bool> isPersonBox() async {
    if (!Hive.isBoxOpen('personBox')) {
      await Hive.openBox<PersonModel>('personBox');
    }
    Box<PersonModel> personBox = Hive.box<PersonModel>('personBox');
    PersonModel? personModel = personBox.get('person');

    return personModel == null ? false : true;
  }
}
