// ignore_for_file: must_be_immutable, library_private_types_in_public_api

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jista/data/constant/appbar_text/appbar_title.dart';
import 'package:jista/data/constant/pages/pages_list.dart';
import 'package:jista/product/components/appbar.dart';
import 'package:jista/product/models/person/person_model.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../product/widget/navigation_drawer_widget.dart';
import 'base_model.dart';

class BaseTabsView extends StatefulWidget {
  BaseTabsView({
    Key? key,
    //this.onModelRead,
  }) : super(key: key);

  // baseviewı kullanan widget, personelmodele ihtiyaç duyduğunda
  PersonModel? personModel;

  List<PagesList>? pagesList; //bottom için indeksle gezeceğimiz sayfaları alıyoruz

  @override
  _BaseTabsViewState createState() => _BaseTabsViewState();
}

class _BaseTabsViewState extends State<BaseTabsView> {
  PersonModel? personModel;
  final String home = 'Anasayfa';
  final String cargoInfo = 'Kargo';
  final String sizeInfo = 'Ölçülerim';
  final String requestPeriod = 'İsteklerim';

  List<PageRouteInfo> pages = PagesList.pagesList;
  BaseModel? viewModel;
  final controllerBaseTabs = Get.put<BaseModel>(BaseModel());

  @override
  void initState() {
    super.initState();
    viewModel = Get.find<BaseModel>();
    personModel = getPersonel();
  }

  getPersonel() {
    return widget.personModel ??= viewModel?.getPersonHive();
  }

  /* BASEVİEWE BİR DEĞER GÖNDERİP SCAfFOLDUN OLUŞUP OLUŞMAYACAĞINI SORACAZ VE ONA GÖRE SCAFFOLDA VEYA DİREK SAYFAYI OLUŞTURCAZ*/
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: AutoTabsScaffold(
        appBarBuilder: (context, tabsRouter) => MyAppBar.getAppBar(controllerBaseTabs),
        drawer: NavigationDrawer(imagePath: 'assets/images/person.png', personModel: personModel!),
        routes: pages,
        bottomNavigationBuilder: (_, tabsRouter) => _buildBottomNavigatonBar(tabsRouter),
      ),
    );
  }

  Widget _buildBottomNavigatonBar(TabsRouter tabsRouter) {
    return SalomonBottomBar(
      currentIndex: tabsRouter.activeIndex,
      onTap: (index) {
        tabsRouter.setActiveIndex(index);
        setAppTitle(index);
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

  void setAppTitle(int index) {
    switch (index) {
      case 0:
        controllerBaseTabs.appbarTitle.value = AppbarTitle.homePageTitle;
        break;
      case 1:
        controllerBaseTabs.appbarTitle.value = AppbarTitle.cargoPageTitle;
        break;
      case 2:
        controllerBaseTabs.appbarTitle.value = AppbarTitle.sizeInfoPageTitle;
        break;
      case 3:
        controllerBaseTabs.appbarTitle.value = AppbarTitle.periodPageTitle;
        break;
      default:
    }
  }
}
