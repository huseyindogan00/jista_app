// ignore_for_file: must_be_immutable, library_private_types_in_public_api

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:jista/core/services/service_result/base/service_result.dart';
import 'package:jista/core/utility/appbarController/appbar_base_tabs_title.dart';
import 'package:jista/data/constant/appbar_text/appbar_title.dart';
import 'package:jista/data/constant/pages/pages_list.dart';
import 'package:jista/product/components/appbar.dart';
import 'package:jista/product/models/person/person_model.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../data/theme/theme_app.dart';
import '../../product/widget/navigation_drawer_widget.dart';
import 'base_model.dart';

class BaseTabsView extends StatefulWidget {
  BaseTabsView({
    @PathParam() required this.personModel,
    Key? key,
  }) : super(key: key);

  // baseviewı kullanan widget, personelmodele ihtiyaç duyduğunda
  dynamic personModel;

  @override
  _BaseTabsViewState createState() => _BaseTabsViewState();
}

class _BaseTabsViewState extends State<BaseTabsView> {
  PersonModel? personModel;
  final String home = 'Anasayfa';
  final String cargoInfo = 'Kargo Bilgileri';
  final String sizeInfo = 'Ölçülerim';
  final String requestPeriod = 'İsteklerim';

  BaseModel? viewModel;
  final controllerBaseTabs = Get.put<BaseModel>(BaseModel());

  @override
  void initState() {
    super.initState();
    viewModel = Get.find<BaseModel>();

    personModel = (widget.personModel as ServiceResult).data as PersonModel ?? getPersonel();
  }

  getPersonel() {
    return widget.personModel ??= controllerBaseTabs.getPersonHive();
  }

  /* BASEVİEWE BİR DEĞER GÖNDERİP SCAfFOLDUN OLUŞUP OLUŞMAYACAĞINI SORACAZ VE ONA GÖRE SCAFFOLDA VEYA DİREK SAYFAYI OLUŞTURCAZ*/
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeApp.themeLight,
      darkTheme: ThemeApp.themeDark,
      home: AutoTabsScaffold(
        appBarBuilder: (context, tabsRouter) => MyAppBar.getAppBar(controllerBaseTabs),
        drawer: NavigationDrawer(imagePath: 'assets/images/person.png', personModel: personModel!),
        routes: PagesList.pagesList,
        bottomNavigationBuilder: (_, tabsRouter) => _buildBottomNavigatonBar(tabsRouter),
      ),
    );
  }

  Widget _buildBottomNavigatonBar(TabsRouter tabsRouter) {
    return SalomonBottomBar(
      currentIndex: tabsRouter.activeIndex,
      onTap: (index) {
        tabsRouter.setActiveIndex(index);
      },
      items: <SalomonBottomBarItem>[
        SalomonBottomBarItem(
          icon: const Icon(Icons.home),
          title: Text(home),
        ),
        SalomonBottomBarItem(
          icon: const Icon(Icons.local_shipping_outlined),
          title: Text(cargoInfo),
        ),
        SalomonBottomBarItem(
          icon: const Icon(Icons.square_foot_outlined),
          title: Text(sizeInfo),
        ),
        SalomonBottomBarItem(
          icon: const Icon(Icons.calendar_month_outlined),
          title: Text(requestPeriod),
        ),
      ],
    );
  }
}
