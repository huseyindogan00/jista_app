// ignore_for_file: must_be_immutable, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jista/core/enums/view_state.dart';
import 'package:jista/data/constant/pages/pages_list.dart';
import 'package:jista/product/models/person/person_model.dart';
import 'package:jista/product/models/product/product_model.dart';

import '../../product/components/appbar.dart';
import 'base_model.dart';
import '../../product/widget/navigation_drawer_widget.dart';

class BaseView<T extends BaseModel> extends StatefulWidget {
  BaseView({
    Key? key,
    required this.appTitle,
    required this.onBuilder,
    this.onBuilderProductModel,
    this.pagesList,
    this.personModel,
    //this.onModelRead,
  }) : super(key: key);

  // baseviewı kullanan widget, personelmodele ihtiyaç duyduğunda
  PersonModel? personModel;

  //verilen modelController üzerinden productmodelini dolduran callbackfunction
  Future<List<ProductModel>?> Function(T model)? onBuilderProductModel;

  final Widget Function(
          BuildContext context, T model, List<ProductModel>? productModel)
      onBuilder; // callfunction ile body de kullanılacak fonksiyonu alıyoruz
  //final Function(T model)? onModelRead; // BaseViewı kullanan widgetın T tipindeki viewModeli geri döndürmek için
  T? viewModel; //BaseView widgetınının içinde T viewModelini kullanmak için
  String appTitle; // baseviewı kullanan widgetların appbar titleını alıyoruz
  List<PagesList>?
      pagesList; //bottom için indeksle gezeceğimiz sayfaları alıyoruz

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
  T? viewModel;

  @override
  void initState() {
    super.initState();
    // CONTROLLER MODEL HERZAMAN T TİPİNDE ATANIYOR
    viewModel = Get.find<T>();
    // PERSONEL MODEL SINIFA VERİLMEZSE TELEFON HAFIZASINDAN GETİR
    getPersonel();
    // BaseView PRODUCTMODELE ihtiyaç duyarsa getir
    getProduct();
  }

  getPersonel() {
    
    return widget.personModel ??= viewModel?.getPersonHive();
  }

  getProduct() async {
    if (widget.onBuilderProductModel != null) {
      widget.onBuilderProductModel!(viewModel!);
    }
  }

  /* BASEVİEWE BİR DEĞER GÖNDERİP SCAfFOLDUN OLUŞUP OLUŞMAYACAĞINI SORACAZ VE ONA GÖRE SCAFFOLDA VEYA DİREK SAYFAYI OLUŞTURCAZ*/
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
                      Navigator.popUntil(context, (route) => false);
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
          appBar: MyAppBar().getAppBar(viewModel!, context),
          drawerEnableOpenDragGesture: true,
          drawer: NavigationDrawer(
              imagePath: 'assets/images/person.png',
              personModel: getPersonel()),
          bottomNavigationBar: _buildBottomNavigatonBar(context),
          backgroundColor: Theme.of(context).backgroundColor,
          body: Obx(
            () => viewModel?.viewState == ViewState.Busy
                ? Container(
                    alignment: Alignment.center,
                    color: Colors.grey,
                    child: const CircularProgressIndicator(color: Colors.red),
                  )
                : viewModel!.selectedBottomIndex > 0
                    ? pages[viewModel!.selectedBottomIndex]
                    : widget.onBuilder(
                        context, viewModel!, ProductModel.productList),
          )

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
    const fixedColor = Colors.blueAccent;

    return Obx(
      () => BottomNavigationBar(
        backgroundColor: backgroundColor,
        elevation: 50,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: viewModel!.selectedBottomIndex,
        selectedFontSize: selectedFontSize,
        unselectedItemColor: unselectedItemColor,
        unselectedIconTheme: unselectedIconTheme,
        fixedColor: fixedColor,
        iconSize: iconSize,
        onTap: (index) {
          viewModel!.selectIndex(index);
          print('Bootom da değişen index : $index');
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
