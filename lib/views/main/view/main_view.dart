// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jista/data/constant/pages/pages_list.dart';
import 'package:jista/product/models/person/person_model.dart';
import 'package:jista/views/main/vm/main_view_model.dart';

import '../../../product/components/appbar.dart';
import '../../../product/widget/navigation_drawer_widget.dart';

/* class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);
  @override
  State<MainView> createState() => _MainViewState();
} */

class MainView extends GetView<MainViewModel> {
  PersonModel? personModel = Get.arguments;
  //int selectedIndex = 0;
  final String appbarTitle = 'Anasayfa';
  final String home = 'Anasayfa';
  final String cargoInfo = 'Kargo Bilgileri';
  final String sizeInfo = 'Ölçü Bilgileri';
  final String requestPeriod = 'İstek Dönemi';

  List<Widget> pages = PagesList.pagesList;

  /* @override
  void initState() {
    getPersonel();
    appbarTitle = home; 
  } */

  /* getPersonel() {
    if (Get.arguments == null) {
      personModel = HiveService().getBox('person');
    } else {
      personModel = Get.arguments;
    }
  } */

  // FAB da kullanılan bubble paketi için gerekli animasyon sınıfları başlatılıyor
  /* initializationAnimate() {
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    final curverAnimation = CurvedAnimation(parent: animationController, curve: Curves.easeInOut);
    animation = Tween<double>(begin: 0, end: 1).animate(curverAnimation);
  } */

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      //PROGRAMDAN TAMAMEN ÇIKIP ÇIKMAMAYI KONTROL EDİLİYOR
      onWillPop: () async {
        final result = await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Çıkmak istediğinizden emin misiniz?'),
              actions: [
                TextButton(
                    onPressed: () {
                      Get.toEnd(() => null);
                    },
                    child: const Text('Evet')),
                TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text('Hayır'))
              ],
            );
          },
        );
        return result;
      },
      child: Scaffold(
        appBar: MyAppBar.getAppBar(),
        drawerEnableOpenDragGesture: false,
        drawer: NavigationDrawer(
          imagePath: 'assets/images/person.png',
          personModel: personModel!,
        ),
        bottomNavigationBar: _buildBottomNavigatonBar(context),
        backgroundColor: Theme.of(context).backgroundColor,
        body: Obx(() => pages[controller.selectIndex.value]),
      ),
    );
  }

  Widget _buildBottomNavigatonBar(BuildContext context) {
    //const selectedIconTheme = IconThemeData(color: Colors.amber, size: 32);
    const unselectedItemColor = Colors.white;
    const unselectedIconTheme = IconThemeData(color: Colors.white, size: 28);
    const double selectedFontSize = 14;
    const double iconSize = 34;
    final backgroundColor = Theme.of(context).appBarTheme.backgroundColor;
    final fixedColor = Colors.amber.shade600;

    return Obx(
      () => BottomNavigationBar(
        backgroundColor: backgroundColor,
        elevation: 10,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: controller.selectIndex.value,
        selectedFontSize: selectedFontSize,
        unselectedItemColor: unselectedItemColor,
        unselectedIconTheme: unselectedIconTheme,
        fixedColor: fixedColor,
        iconSize: iconSize,
        onTap: _buildOnTap,
        items: _buildBottomItemList,
      ),
    );
  }

  // BOTTOM İTEMLAR DEĞİŞTİĞİNDE
  void _buildOnTap(int index) {
    controller.currentIndex(index);
    switch (index) {
      case 0:
        controller.appbarTitle.value = home;
        break;
      case 1:
        controller.appbarTitle.value = cargoInfo;
        break;
      case 2:
        controller.appbarTitle.value = sizeInfo;
        break;
      case 3:
        controller.appbarTitle.value = requestPeriod;
        break;
    }
  }

  List<BottomNavigationBarItem> get _buildBottomItemList {
    return [
      BottomNavigationBarItem(
        icon: const Icon(Icons.supervised_user_circle),
        label: home,
        tooltip: 'Anasayfa',
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.local_shipping_outlined),
        label: cargoInfo,
        tooltip: 'Kargo Bilgisi',
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.square_foot_outlined),
        label: sizeInfo,
        tooltip: 'Ölçü Bilgileri',
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.calendar_month_outlined),
        label: requestPeriod,
        tooltip: 'İstek Dönemi',
      ),
    ];
  }
}
