// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:auto_route/auto_route.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jista/core/utility/appbarController/appbar_base_tabs_title.dart';
import '../../views/base/base_model.dart';

class MyAppbar extends AutoRouterObserver {
  final BaseModel _controllerBaseModel = Get.put<BaseModel>(BaseModel());

  setAppbarTitle(String routeName) {
    switch (routeName) {
      case 'HomeRoute':
        _controllerBaseModel.appbarTitle.value = 'Anasayfa';
        break;
      case 'ProductsRoute':
        _controllerBaseModel.appbarTitle.value = 'Ürünler';
        break;
      case 'ProductsDetailsRoute':
        _controllerBaseModel.appbarTitle.value = 'ÜrünlerDetayı';
        break;
      default:
    }
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    // TODO: implement didPush
    super.didPush(route, previousRoute);
    print('itilen sayfa -----------------> ${route.settings.name}');
    //setAppbarTitle(route.settings.name.toString());
  }

  PreferredSizeWidget getAppBar(BuildContext context, TabsRouter tabsRouter) {
    print('Appbar sınıfı çağrıldı ');
    return AppBar(
      centerTitle: true,
      leading: const AutoLeadingButton(),
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

/*   @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    print('didChangeTabRoute değerii ------> ${route.name}');
  }

  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    print('didInitRoute değerii ------> ${route.name}');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    print('didPop değerii ------> ${route.settings.name}');
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    print('didPush değerii ------> ${route.settings.name}');
    AppbarBaseTabsTitle.setAppTitleWithString(previousRoute?.settings.name);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    print('didRemove değerii ------> ${route.settings.name}');
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    print('didReplace değerii ------> ${newRoute?.settings.name}');
  }

  @override
  void didStartUserGesture(Route route, Route? previousRoute) {
    print('didStartUserGesture değerii ------> ${route.settings.name}');
  }

  @override
  void didStopUserGesture() {
    print('didStopUserGesture değeri çalıştı ************************************');
  } */

  /* @override
  NavigatorState? get navigator =>  ; */
}




/* class MyAppbarObserver extends AutoRouteObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    print('didPush değerii ------> ${route.settings.name}');
    switch (route.settings.name) {
      case 'ProductsRoute':
        titleAppbar = 'Ürünlerss';
        break;
      case 'ProductsDetailsRoute':
        titleAppbar = 'ÜrünlerDetayı';
        break;
      default:
    }
    super.didPop(route, previousRoute);
  }
}
 */








/* class MyAppBar extends AutoRouterObserver {
  //MyAppBar._singleInstance();

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
                  style: Get.theme.textTheme.headline6?.copyWith(color: Colors.red),
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

  @override
  void didPush(Route route, Route? previousRoute) {
    // TODO: implement didPush
    print('didPush Methodu - Gösterilen sayfa*****************************************************');
    print(route.settings.name);
    AppbarBaseTabsTitle.setAppTitleWithString(previousRoute?.settings.name.toString());
    print('didPush - Bir önceki sayfa*****************************************************');
    print(previousRoute?.settings.name.toString());
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    // TODO: implement didPop
    print('didPop Method - Gösterilen sayfa*****************************************************');
    print(route.settings.name);
    print('didPop - Bir önceki sayfa*****************************************************');
    print(previousRoute?.settings.name.toString());

    super.didPop(route, previousRoute);
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    print(route.index);
    //AppbarBaseTabsTitle.setAppTitleWithIndex(route.index);
    super.didChangeTabRoute(route, previousRoute);
  }
} */
