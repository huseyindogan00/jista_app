import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jista/core/enums/view_state.dart';

class BaseModel extends GetxController {
  //**************************************************
  // SAYFA İŞLEM YAPTIĞINDA BEKLEME DURUMUNU BELİRTİR
  Rx<ViewState> _viewState = ViewState.Idle.obs;
  ViewState get viewState => _viewState.value;

  set viewState(ViewState viewState) {
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
}
