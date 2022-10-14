import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:jista/core/enums/view_state.dart';
import 'package:jista/product/models/product/product_model.dart';

import '../../core/services/service/hive_service.dart';
import '../../core/utility/internet_connection_control.dart';
import '../../product/models/person/person_model.dart';

class BaseModel extends GetxController {
//**************************************************
  // Çıkışın yapılıp yapılmadığını kontrol eder, duruma göre kullanıcı verilerini
  // silmek için kullanılır
  RxBool isExit = false.obs;

  //**************************************************
  // BASEMODELİ extend eden widgetlardan sepet güncellenicek
  RxString appbarTitle = ''.obs;
  RxList<ProductModel> productList = <ProductModel>[].obs;

  //**************************************************
  // SAYFA İŞLEM YAPTIĞINDA BEKLEME DURUMUNU BELİRTİR
  final Rx<ViewState> _viewState = ViewState.Idle.obs;
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

  //**************************************************
  // BASEMODELİ extend eden widgetlardan sepet güncellenicek
  Rx<bool> isConnection = true.obs;
  // BU METHOD CİHAZI İNTERNETE BAĞLAYAN WİFİ, MOBİL VERİ VS OLAN UÇLARINI KONTROL EDER
  Future<bool> internetControl() async {
    bool hasDeviceConnected = await _isDeviceConnected();
    if (hasDeviceConnected) {
      InternetConnectionControl connection = InternetConnectionControl();
      ConnectivityResult status = await connection.connectionStatus();
      if (status != ConnectivityResult.none) {
        return true;
      }
    }
    Get.showSnackbar(const GetSnackBar(
      duration: Duration(seconds: 2),
      snackPosition: SnackPosition.BOTTOM,
      message: 'İnternet bağlantınızı kontrol ediniz.',
    ));
    return false;
  }

  // CİHAZI İNTERNETE BAĞLAYAN UÇLARI AÇIK OLSA DAHİ İNTERNET
  // BAĞLANTISININ SAĞLANIP SAĞLANMADIĞINI KONTROL EDER
  static Future<bool> _isDeviceConnected() async {
    bool isDeviceConnected = await InternetConnectionChecker().hasConnection;
    return isDeviceConnected;
  }
}
