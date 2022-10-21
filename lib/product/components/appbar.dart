// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:auto_route/auto_route.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jista/core/router/auto_router/router.gr.dart';
import 'package:jista/core/utility/appbarController/appbar_base_tabs_title.dart';
import '../../views/base/base_model.dart';

class MyAppbar {
  final _baseModelController = Get.put<BaseModel>(BaseModel());

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
                  _baseModelController.cartTotal.value.toString(),
                  style: Get.theme.textTheme.headline6
                      ?.copyWith(color: Colors.red),
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
