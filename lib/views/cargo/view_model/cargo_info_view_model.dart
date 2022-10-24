import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jista/product/models/address/address_model.dart';
import 'package:jista/views/base/base_model.dart';

class CargoInfoViewModel extends BaseModel {
  RxList<DropdownMenuItem<String>>? townList = <DropdownMenuItem<String>>[].obs;
  RxString townFirstValue = ''.obs;
}
