import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jista/core/enums/view_state.dart';
import 'package:jista/core/init/app_init.dart';
import 'package:jista/core/services/service/firebase_store_service.dart';
import 'package:jista/core/services/service/hive_service.dart';
import 'package:jista/core/services/service_result/firebase_service_result_model.dart';
import 'package:jista/product/models/address/address_model.dart';
import 'package:jista/product/models/person/person_model.dart';
import 'package:jista/views/base/base_model.dart';

class CargoViewModel extends BaseModel {
  final _fireStoreService = locator<FirebaseStoreService>();
  final box = locator<HiveService>();

  RxList<DropdownMenuItem<String>>? townList = <DropdownMenuItem<String>>[].obs;
  RxString townFirstValue = ''.obs;
  RxString selectedCity = ''.obs;
  RxString selecteTown = ''.obs;

  Future<FirebaseServiceResultModel> updateAddress(String personId, AddressModel addressModel) async {
    setViewState(ViewState.BUSY);
    FirebaseServiceResultModel result = _fireStoreService.updateAddress(personId, addressModel);
    await savePersonAndAddress(addressModel);
    setViewState(ViewState.IDLE);
    return result;
  }

  savePersonAndAddress(AddressModel addressModel) async {
    PersonModel? personModel = await box.getBoxPerson('person');
    personModel?.address = addressModel;
    box.saveBoxPerson(personModel!);
  }
}
