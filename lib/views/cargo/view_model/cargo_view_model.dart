import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jista/core/enums/view_state.dart';
import 'package:jista/core/services/service/firebase_store_service.dart';
import 'package:jista/core/services/service_result/firebase_service_result_model.dart';
import 'package:jista/main.dart';
import 'package:jista/product/models/address/address_model.dart';
import 'package:jista/views/base/base_model.dart';

class CargoViewModel extends BaseModel {
  final _fireStoreService = locator<FirebaseStoreService>();

  RxList<DropdownMenuItem<String>>? townList = <DropdownMenuItem<String>>[].obs;
  RxString townFirstValue = ''.obs;
  RxString selectedCity = ''.obs;
  RxString selecteTown = ''.obs;

  Future<FirebaseServiceResultModel> updateAddress(String personId, AddressModel addressModel) async {
    setViewState(ViewState.BUSY);
    FirebaseServiceResultModel result = await _fireStoreService.updateAddress(personId, addressModel);
    setViewState(ViewState.IDLE);
    return result;
  }
}
