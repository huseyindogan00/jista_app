// ignore_for_file: must_be_immutable

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jista/core/router/auto_router/router.gr.dart';
import 'package:jista/data/constant/font/const_text_style.dart';
import 'package:jista/data/constant/type/type_name.dart';
import 'package:jista/product/widget/my_appbar_widget.dart';
import 'package:jista/product/widget/navigation_drawer_widget.dart';
import 'package:jista/views/home/view_model/home_view_model.dart';

import '../../../data/constant/const_assets_images.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  late final controller = Get.put<HomeViewModel>(HomeViewModel());

  final double imageLeftValue = 0;
  final double imageBottomValue = 5;
  final double imageContainerHeight = 130;
  final double imageContainerWidth = 150;
  final double cardContainerHeight = 90;
  final cardContainerMargin = const EdgeInsets.only(top: 50);

  @override
  Widget build(BuildContext context) {
    print('Home build');
    return Scaffold(
      appBar: MyAppbarWiget.createAppbar(title: 'Anasayfa').getAppBar(context),
      drawer: NavigationDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Stack(
            children: [
              Wrap(
                runSpacing: 40,
                children: _buildCategoryList(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildCategoryList(BuildContext context) {
    return [
      GestureDetector(
        child: _buildProductCard(ConstAssetsImages.trainingClothing, 'EĞİTİM GİYECEĞİ'),
        onTap: () async {
          bool connection = await controller.internetControl();
          if (connection) context.router.push(ProductsRoute(productTypeName: TypeName.egitimGiyecegi));
        },
      ),
      GestureDetector(
        child: _buildProductCard(ConstAssetsImages.serviceWear, 'HİZMET GİYECEĞİ'),
        onTap: () async {
          bool connection = await controller.internetControl();
          if (connection) context.router.push(ProductsRoute(productTypeName: TypeName.hizmetGiyecegi));
        },
      ),
      GestureDetector(
        child: _buildProductCard(ConstAssetsImages.stafTaskClothing, 'KADRO GÖREV GİYECEĞİ'),
        onTap: () async {
          bool connection = await controller.internetControl();
          if (connection) {
            await context.router.push(ProductsRoute(productTypeName: TypeName.kadroGorevKiyafeti));
          }
        },
      ),
      GestureDetector(
        child: _buildProductCard(ConstAssetsImages.coldClimateClothing, 'SOĞUK İKLİM'),
        onTap: () async {
          bool connection = await controller.internetControl();
          if (connection) context.router.push(ProductsRoute(productTypeName: TypeName.sogukIklimGiyecgi));
        },
      ),
    ];
  }

  Widget _buildProductCard(AssetImage assetsImages, String title) {
    return Stack(
      children: [
        _card(),
        _image(assetsImages),
        _title(title),
      ],
    );
  }

  Positioned _card() {
    return Positioned(
      child: Container(
        width: double.infinity,
        margin: cardContainerMargin,
        height: cardContainerHeight,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 74, 133, 160),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(5),
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(30),
          ),
        ),
      ),
    );
  }

  Positioned _image(AssetImage assetsImages) {
    return Positioned(
      left: imageLeftValue,
      bottom: imageBottomValue,
      child: Container(
        width: imageContainerWidth,
        height: imageContainerHeight,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: assetsImages,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }

  Positioned _title(String title) {
    return Positioned(
      right: 0,
      bottom: 17,
      child: SizedBox(
        width: 230,
        child: ListTile(
          title: Text(
            title,
            style: ConstTextStyle.categoriTextStyle.copyWith(fontSize: 14, color: Colors.white),
          ),
          subtitle: const Text('Buraya açıklama girilecek'),
          trailing: const Icon(Icons.arrow_forward_ios_outlined),
        ),
      ),
    );
  }
}
