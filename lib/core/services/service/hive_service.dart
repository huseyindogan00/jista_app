import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jista/models/person/person_model.dart';
import 'package:jista/models/user/user_model.dart';

class HiveService {
  static String _boxName = 'personBox';
  late Box<PersonModel> box;

  HiveService() {
    box = Hive.box<PersonModel>(_boxName);
  }

  getBox(String boxName) {}

  savePerson(PersonModel personModel) async {
    await box.put('person', personModel);
    print(box.get('person'));
  }

  deleteUserBox(String boxName) async {
    await Hive.deleteBoxFromDisk(boxName);
  }

  bool isPersonBox() {
    var personBox = Hive.box<PersonModel>('personBox');
    var personModel = personBox.get('personBox');
    print(personModel);

    return personModel == null ? false : true;
  }
}
