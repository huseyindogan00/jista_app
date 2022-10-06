// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../views/base/base_model.dart';

class MyAppBar {
  AppBar getAppBar(BaseModel viewModel, BuildContext context) {
    const iconBack = Icon(Icons.arrow_back_ios_new);
    const iconMenuDrawer = Icon(Icons.menu_rounded);
    bool navigatorState = Navigator.canPop(context);

    return AppBar(
      centerTitle: true,
      title: Obx(
        () => Text(
          viewModel.appbarTitle.value,
          style: const TextStyle(
              fontFamily: 'Montserrat', fontWeight: FontWeight.w700),
        ),
      ),
      leading: navigatorState
          ? Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: iconBack,
                  onPressed: () {
                    Get.back();
                  },
                );
              },
            )
          : Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: iconMenuDrawer,
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                );
              },
            ),
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
            child:
                const Icon(Icons.add_shopping_cart_sharp, color: Colors.white),
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
