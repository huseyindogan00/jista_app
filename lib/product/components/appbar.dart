// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:auto_route/auto_route.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../views/base/base_model.dart';

class MyAppBar {
  late final BaseModel controllerBaseModel;

  MyAppBar() {
    controllerBaseModel = Get.put<BaseModel>(BaseModel());
  }

  AppBar getAppBar(BuildContext context) {
    print('appbar çalıştı');
    return AppBar(
      centerTitle: true,
      leading: const AutoLeadingButton(),
      //backgroundColor: Get.theme.backgroundColor,
      title: Obx(
        () => Text(
          controllerBaseModel.appbarTitle.value,
          style: Get.theme.textTheme.headline5,
        ),
      ),
      actions: [
        InkWell(
          onTap: () {
            print('Carta tıklandı');
          },
          child: Badge(
            padding: const EdgeInsets.all(5),
            elevation: 10,
            badgeColor: Colors.white,
            toAnimate: true,
            animationType: BadgeAnimationType.fade,
            position: const BadgePosition(start: 20, bottom: 25),
            alignment: const Alignment(0, 0.3),
            badgeContent: Obx(
              () => Text(
                controllerBaseModel.cartTotal.value.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            child: const Icon(
              Icons.add_shopping_cart_sharp,
            ),
          ),
        ),
        const SizedBox(width: 30),
      ],
    );
  }
}
