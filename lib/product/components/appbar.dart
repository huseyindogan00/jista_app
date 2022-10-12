// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../views/base/base_model.dart';

class MyAppBar {
  static AppBar getAppBar(BaseModel controllerBaseTabs) {
    return AppBar(
      centerTitle: true,
      title: Obx(
        () => Text(
          controllerBaseTabs.appbarTitle.value,
          style: const TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w700),
        ),
      ),
      leading: const AutoLeadingButton(),
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
}
