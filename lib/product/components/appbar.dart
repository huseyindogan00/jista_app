import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jista/views/main/view_model/main_view_model.dart';

class MyAppBar {
  static final MainViewModel _controller = Get.find<MainViewModel>();

  static AppBar getAppBar() {
    return AppBar(
      centerTitle: true,
      title: Obx(
        () => Text(_controller.appbarTitle.value,
            style: const TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w700)),
      ),
      leading: null,
      actions: [
        Badge(
          badgeColor: Colors.white,
          animationType: BadgeAnimationType.fade,
          position: const BadgePosition(start: 20, bottom: 25),
          alignment: const Alignment(0, 0.3),
          badgeContent: const Text(
            '52',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          child: InkWell(
            child: const Icon(Icons.add_shopping_cart_sharp, color: Colors.white),
            onTap: () {
              print('Carta tıklandı');
            },
          ),
        ),
        const SizedBox(width: 30),
      ],
    );
  }

  // APPBAR DA LEADİNGİ KAPATMAM GEREK CATEGORY SAYFASINDAN GİTTİĞİMDA APPBARDA DRAWER YERİNE GERİ BUTONU OLARAK LEADİNGE ICON ATAMAM VE O ICON İLE GERİ DÖNÜŞÜ SAĞLAMALIYIM.
  /* static Widget? _buildLeading() {
    return Obx(
      () => _controller.isAppbarLeading.value
          ? InkWell(
              onTap: () => _controller.selectIndex.value = 0,
              child: const Icon(Icons.arrow_back_ios_outlined),
            )
          : null,
    );
  } */
}
