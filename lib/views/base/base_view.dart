// ignore_for_file: must_be_immutable, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jista/data/constant/pages/pages_list.dart';
import 'package:jista/product/models/person/person_model.dart';

import '../../product/components/appbar.dart';
import 'base_model.dart';
import '../../product/widget/navigation_drawer_widget.dart';

class BaseView<T extends BaseModel> extends StatefulWidget {
  BaseView({
    Key? key,
    required this.appTitle,
    required this.onBuilder,
    this.pagesList,
    this.onModelRead,
  }) : super(key: key);

  final Widget Function(BuildContext context, T model) onBuilder;
  final Function(T model)? onModelRead;
  T? viewModel;
  String appTitle;
  List<PagesList>? pagesList;

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseModel> extends State<BaseView<T>> {
  PersonModel? personModel = Get.arguments;
  //int selectedIndex = 0;
  final String home = 'Anasayfa';
  final String cargoInfo = 'Kargo Bilgileri';
  final String sizeInfo = 'Ölçü Bilgileri';
  final String requestPeriod = 'İstek Dönemi';

  List<Widget> pages = PagesList.pagesList;

  @override
  void initState() {
    super.initState();
    widget.viewModel = Get.find<T>();
    if (widget.onModelRead != null) {
      widget.onModelRead!(widget.viewModel!);
    }
  }

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
        appBar: MyAppBar().getAppBar(widget.appTitle),
        drawerEnableOpenDragGesture: false,
        drawer: NavigationDrawer(
            imagePath: 'assets/images/person.png', personModel: personModel!),
        bottomNavigationBar: _buildBottomNavigatonBar(context),
        backgroundColor: Theme.of(context).backgroundColor,
        body: widget.onBuilder(context, widget.viewModel!),

        //Obx(() => pages[model.selectedBottomIndex]),
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
        currentIndex: widget.viewModel!.selectedBottomIndex,
        selectedFontSize: selectedFontSize,
        unselectedItemColor: unselectedItemColor,
        unselectedIconTheme: unselectedIconTheme,
        fixedColor: fixedColor,
        iconSize: iconSize,
        onTap: (index) {
          widget.viewModel!.selectIndex(index);
        },
        items: _buildBottomItemList,
      ),
    );
  }

  // BOTTOM İTEMLAR DEĞİŞTİĞİNDE

  List<BottomNavigationBarItem> get _buildBottomItemList {
    return [
      BottomNavigationBarItem(
        icon: const Icon(Icons.home),
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
