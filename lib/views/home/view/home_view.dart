import 'package:flutter/material.dart';
import 'package:jista/constant/font/const_text_style.dart';
import 'package:jista/core/services/service_result/base/service_result.dart';
import 'package:jista/core/services/service_result/firebase_service_result_model.dart';
import 'package:jista/models/product/product_model.dart';
import 'package:jista/views/home/vm/home_view_model.dart';
import 'package:jista/product/widget/bottom_navi_bar.dart';

import '../../../constant/const_assets_images.dart';
import '../../../main.dart';
import '../../../product/components/appbar.dart';
import '../../../product/components/categories_fab.dart';
import '../../../product/widget/navigation_drawer_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  List<ProductModel>? productList = [];

  @override
  void initState() {
    getAllProduct();
    initializationAnimate();
    super.initState();
  }

  getAllProduct() async {
    FirebaseServiceResultModel<List<ProductModel>> result =
        await HomeViewModel.getAllProduct();
    productList = result.data;
    print('getAllProduct girdi sorgu sonucu : ${result.data}');
  }

  // FAB da kullanılan bubble paketi için gerekli animasyon sınıfları başlatılıyor
  initializationAnimate() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    final curverAnimation =
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut);
    animation = Tween<double>(begin: 0, end: 1).animate(curverAnimation);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      //PROGRAMDAN TAMAMEN ÇIKIP ÇIKMAMAYI KONTROL EDİLİYOR
      onWillPop: () async {
        if (animationController.isCompleted) {
          animationController.reverse();
          return false;
        } else {
          final result = await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Çıkmak istediğinizden emin misiniz?'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.maybePop(context, true);
                      },
                      child: const Text('Evet')),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      child: const Text('Geri'))
                ],
              );
            },
          );
          return result;
        }
      },
      child: Scaffold(
        appBar: appbar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: categoriesFAB(animation, animationController),
        drawer: const NavigationDrawer(),
        bottomNavigationBar: BottomNaviBar(),
        body: productList!.isNotEmpty
            ? ListView.builder(
                itemCount: productList!.length,
                itemBuilder: (context, index) {
                  ProductModel product = productList![index];
                  return Card(
                    color: Colors.grey.shade300,
                    child: ListTile(
                      title: Text(product.type),
                      trailing: product.cargoStatus
                          ? const Icon(Icons.local_shipping_rounded,
                              color: Colors.yellow)
                          : const Icon(Icons.local_shipping_outlined,
                              color: Colors.red),
                      subtitle: Text(product.title),
                    ),
                  );
                },
              )
            : Center(
                child: Container(
                child: Text('Ürünler veri tabanından çekilemedi'),
              )),
      ),
    );
  }

  SingleChildScrollView demoHome(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildCategory(
              context, ConstAssetsImages.serviceWear, 'Hizmet Kıyafeti'),
          _buildCategory(
              context, ConstAssetsImages.trainingClothing, 'Eğitim Kıyafeti'),
          _buildCategory(context, ConstAssetsImages.stafTaskClothing,
              'Kadro Görev Kıyafeti'),
        ],
      ),
    );
  }

  Widget _buildCategory(
      BuildContext context, AssetImage assetsImages, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: InkWell(
        child: Container(
          alignment: Alignment.bottomCenter,
          width: MediaQuery.of(context).size.width,
          height: 200,
          decoration: BoxDecoration(
            boxShadow: const <BoxShadow>[
              BoxShadow(blurRadius: 1, color: Colors.cyan, spreadRadius: 2),
            ],
            image: DecorationImage(image: assetsImages, fit: BoxFit.fill),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 112, 115, 111).withOpacity(0.6),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            width: double.infinity,
            height: 75,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                title,
                style: ConstTextStyle.categoriTextStyle,
                //style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
