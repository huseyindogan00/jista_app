// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:auto_route/auto_route.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jista/core/utility/appbarController/appbar_base_tabs_title.dart';
import '../../core/router/auto_router/router.gr.dart';
import '../../views/base/base_model.dart';

class MyAppbar {
  final _appbarShadowColor = Colors.grey;
  final _badgeColor = Colors.white;
  final _badgeContentColor = Colors.red;

  final _baseModelController = Get.put<BaseModel>(BaseModel());

  PreferredSizeWidget getAppBar(BuildContext context, TabsRouter tabsRouter) {
    print('Appbar sınıfı çağrıldı ');
    return AppBar(
      shadowColor: _appbarShadowColor,
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
              badgeColor: _badgeColor,
              toAnimate: true,
              showBadge: true,
              animationType: BadgeAnimationType.slide,
              position: const BadgePosition(start: 35, bottom: 25),
              alignment: const Alignment(0, 0.3),
              badgeContent: Obx(
                () => Text(
                  _baseModelController.cartTotal.value.toString(),
                  style: Get.theme.textTheme.headline6?.copyWith(color: _badgeContentColor),
                ),
              ),
              child: const Icon(Icons.add_shopping_cart_sharp, size: 24),
            ),
          ),
          onTap: () {
            context.router.push(CartRouter());
          },
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
