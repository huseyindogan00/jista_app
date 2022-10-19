// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:auto_route/auto_route.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jista/core/router/auto_router/router.gr.dart';
import 'package:jista/core/utility/appbarController/appbar_base_tabs_title.dart';
import '../../views/base/base_model.dart';

class MyAppbar extends AutoRouteObserver {
  final BaseModel _controllerBaseModel = Get.put<BaseModel>(BaseModel());

  /*  setAppbarTitle(String? routeName) {
    print(_controllerBaseModel.appbarTitle.value);
    print('******************************************');
    switch (routeName) {
      case 'HomeRoute':
        print('anasayfaya  sayfasına girdi');
        _controllerBaseModel.appbarTitle.value = 'Anasayfa';
        break;
      case 'ProductsRoute':
        print('ürünler sayfasına girdi');
        _controllerBaseModel.appbarTitle.value = 'Ürünler';
        break;
      case 'ProductDetailsRoute':
        print('ürünler detayına girdi');
        _controllerBaseModel.appbarTitle.value = 'Ürünler Detayı';
        break;
      case 'null':
        print('null geldi');
        _controllerBaseModel.appbarTitle.value = 'Anasayfa';
        break;
      default:
    }
  } */

  PreferredSizeWidget getAppBar(BuildContext context, TabsRouter tabsRouter) {
    print('Appbar sınıfı çağrıldı ');
    return AppBar(
      centerTitle: true,
      leading: const AutoLeadingButton(),
      title: GetBuilder<BaseModel>(
        builder: (controller) => Text(controller.appbarTitle.value),
      ),
      actions: [
        InkWell(
          child: SizedBox(
            width: 60,
            child: Badge(
              padding: const EdgeInsets.all(5),
              elevation: 10,
              badgeColor: Colors.white,
              toAnimate: true,
              animationType: BadgeAnimationType.fade,
              position: const BadgePosition(start: 36, bottom: 25),
              alignment: const Alignment(0, 0.3),
              badgeContent: Obx(
                () => Text(
                  _controllerBaseModel.cartTotal.value.toString(),
                  style: Get.theme.textTheme.headline6?.copyWith(color: Colors.red),
                ),
              ),
              child: const Icon(Icons.add_shopping_cart_sharp),
            ),
          ),
          onTap: () {
            context.router.push(CartRoute());
          },
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
