// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:auto_route/auto_route.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jista/core/utility/appbarController/appbar_base_tabs_title.dart';
import '../../views/base/base_model.dart';

class MyAppBar extends AutoRouteObserver {
  //MyAppBar._singleInstance();

  @override
  void didPush(Route route, Route? previousRoute) {
    // TODO: implement didPush
    print(
        'didPush Methodu - Gösterilen sayfa*****************************************************');
    print(route.settings.name);
    print(
        'didPush - Bir önceki sayfa*****************************************************');
    print(previousRoute?.settings.name.toString());
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    // TODO: implement didPop
    print(
        'didPop Method - Gösterilen sayfa*****************************************************');
    print(route.settings.name);
    print(
        'didPush - Bir önceki sayfa*****************************************************');
    print(previousRoute?.settings.name.toString());

    super.didPop(route, previousRoute);
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    // TODO: implement didChangeTabRoute
    print(route.name);
    print(route.index);
    super.didChangeTabRoute(route, previousRoute);
  }

  static final BaseModel _controllerBaseModel = Get.put<BaseModel>(BaseModel());

  static AppBar getAppBar(BuildContext context, TabsRouter tabsRouter) {
    /* print('****************************************************************************');
    print(tabsRouter.pop());
    print('****************************************************************************'); */
    return AppBar(
      centerTitle: true,
      leading: const AutoLeadingButton(),
      //backgroundColor: Get.theme.backgroundColor,

      title: Obx(
        () => Text(
          _controllerBaseModel.appbarTitle.value,
          style: Get.theme.textTheme.headline5,
        ),
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
                  style: Get.theme.textTheme.headline6
                      ?.copyWith(color: Colors.red),
                ),
              ),
              child: const Icon(Icons.add_shopping_cart_sharp),
            ),
          ),
          onTap: () {},
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
