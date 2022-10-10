import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jista/core/enums/view_state.dart';

import '../../core/services/service/hive_service.dart';
import '../../product/models/person/person_model.dart';

class BaseModel extends GetxController {
  //**************************************************
  // BASEMODELİ extend eden widgetlardan sepet güncellenicek
  RxString appbarTitle = ''.obs;

  //**************************************************
  // SAYFA İŞLEM YAPTIĞINDA BEKLEME DURUMUNU BELİRTİR
  Rx<ViewState> _viewState = ViewState.Idle.obs;
  ViewState get viewState => _viewState.value;
  void setViewState(ViewState viewState) {
    _viewState.value = viewState;
  }

  //**************************************************
  // BOTTOMBAR DA İNDEX DEĞİŞİMİ İÇİN DURUM GÜNCELLER
  RxInt _selectedBottomIndex = 0.obs;
  int get selectedBottomIndex => _selectedBottomIndex.value;
  set selectedBottomIndex(int selectedBottomIndex) {
    _selectedBottomIndex = selectedBottomIndex as RxInt;
  }

  selectIndex(int index) {
    _selectedBottomIndex.value = index;
  }

  //**************************************************
  // TELEFONA KAYDEDİLEN PERSONELİ DRAWERDA GÖSTERMEK İÇİN HAFIZADAN GETİRİLİYOR
  PersonModel? getPersonHive() {
    PersonModel? person = HiveService().getBox('person');
    if (person != null) {
      return person;
    }
    return null;
  }

  //**************************************************
  // BASEMODELİ extend eden widgetlardan sepet güncellenicek
  Rx<int> cartTotal = 0.obs;
}
