// ignore_for_file: unused_element

import 'package:auto_route/auto_route.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/router/auto_router/router.gr.dart';
import '../../views/base/base_model.dart';

class MyAppbarWiget {
  Color? color;
  String? title;

  MyAppbarWiget._singleConstructor();

  MyAppbarWiget.createAppbar({
    required this.title,
    this.color,
  });

  final _appbarShadowColor = Colors.grey;
  final _badgeColor = Colors.white;
  final _badgeContentColor = Colors.red;

  final _baseModelController = Get.put<BaseModel>(BaseModel());

  PreferredSizeWidget getAppBar(BuildContext context) {
    return AppBar(
      shadowColor: _appbarShadowColor,
      centerTitle: true,
      leading: const AutoLeadingButton(),
      title: Text(title ?? 'null Geldi'),
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
            context.router.push(const CartRouter());
          },
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
