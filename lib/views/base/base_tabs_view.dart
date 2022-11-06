// ignore_for_file: must_be_immutable, library_private_types_in_public_api

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jista/core/router/auto_router/router.gr.dart';
import 'package:jista/core/services/service_result/base/service_result.dart';
import 'package:jista/data/constant/pages/pages_list.dart';
import 'package:jista/product/models/person/person_model.dart';
import 'package:jista/views/order/view/order_view.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../../data/theme/theme_app.dart';
import '../../product/widget/navigation_drawer_widget.dart';
import 'base_model.dart';

class BaseTabsView extends StatefulWidget {
  BaseTabsView({
    Key? key,
  }) : super(key: key);

  @override
  _BaseTabsViewState createState() => _BaseTabsViewState();
}

class _BaseTabsViewState extends State<BaseTabsView> {
  PersonModel? personModel;
  final String home = 'Anasayfa';
  final String cargoInfo = 'Kargo Bilgileri';
  final String myOrders = 'Siparişlerim';
  final String requestPeriod = 'İsteklerim';

  final Color _bottomColor = const Color.fromARGB(244, 30, 85, 87);
  //final Color _backgroundColorApp = const Color.fromARGB(255, 40, 121, 56).withOpacity(0.7);
  final Color _bottomIconColor = const Color.fromARGB(255, 255, 255, 255);
  final Color _selectedBottomIconColor = const Color.fromARGB(223, 0, 0, 0);

  final controllerBaseTabs = Get.put<BaseModel>(BaseModel());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeApp.themeLight,
      darkTheme: ThemeApp.themeDark,
      home: AutoTabsScaffold(
        homeIndex: 0,
        backgroundColor: const Color.fromARGB(255, 241, 243, 243).withOpacity(0.8),
        //appBarBuilder: (context, tabsRouter) => MyAppbar().getAppBar(context, tabsRouter),
        //drawer: NavigationDrawer(personModel: personModel!),
        routes: <PageRouteInfo>[
          const HomeRouter(),
          const CargoInfoRouter(),
          const OrderRouter(),
          RationRequestPeriodRouter(),
        ],
        bottomNavigationBuilder: (_, tabsRouter) => _buildBottomNavigatonBar(tabsRouter, context),
      ),
    );
  }

  Widget _buildBottomNavigatonBar(TabsRouter tabsRouter, BuildContext context) {
    return Material(
      elevation: 5,
      shadowColor: Colors.grey,
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      color: _bottomColor,
      type: MaterialType.card,
      child: SalomonBottomBar(
        itemPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        currentIndex: tabsRouter.activeIndex,
        onTap: (index) {
          tabsRouter.setActiveIndex(index);
          //AppbarBaseTabsTitle.setAppTitleWithIndex(index);
        },
        items: buildBottomBar(),
      ),
    );
  }

  List<SalomonBottomBarItem> buildBottomBar() {
    _bottomIconColor;
    _selectedBottomIconColor;
    return <SalomonBottomBarItem>[
      SalomonBottomBarItem(
        selectedColor: _selectedBottomIconColor,
        icon: Icon(
          Icons.home,
          color: _bottomIconColor,
        ),
        title: Text(home, style: Get.theme.textTheme.bodyText1),
      ),
      SalomonBottomBarItem(
        selectedColor: _selectedBottomIconColor,
        icon: Icon(
          Icons.local_shipping_outlined,
          color: _bottomIconColor,
        ),
        title: Text(cargoInfo, style: Get.theme.textTheme.bodyText1),
      ),
      SalomonBottomBarItem(
        selectedColor: _selectedBottomIconColor,
        icon: Icon(
          Icons.circle_notifications_sharp,
          color: _bottomIconColor,
        ),
        title: Text(myOrders, style: Get.theme.textTheme.bodyText1),
      ),
      SalomonBottomBarItem(
        selectedColor: _selectedBottomIconColor,
        icon: Icon(
          Icons.calendar_month_outlined,
          color: _bottomIconColor,
        ),
        title: Text(requestPeriod, style: Get.theme.textTheme.bodyText1),
      ),
    ];
  }
}
