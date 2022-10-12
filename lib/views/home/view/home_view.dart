// ignore_for_file: must_be_immutable

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jista/core/router/auto_router/router.gr.dart';
import 'package:jista/data/constant/font/const_text_style.dart';

import '../../../core/utility/appbarController/appbar_base_tabs_title.dart';
import '../../../data/constant/const_assets_images.dart';
import '../../base/base_model.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key}) {
    controller = Get.put(BaseModel());
    AppbarBaseTabsTitle.setAppTitle(0, controller);
  }

  late final controller;

  final double imageLeftValue = 0;
  final double imageBottomValue = 0;
  final double imageContainerHeight = 130;
  final double imageContainerWidth = 150;
  final double cardContainerHeight = 90;
  final cardContainerMargin = const EdgeInsets.only(top: 50);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Wrap(
        runSpacing: 30,
        children: [
          GestureDetector(
            onTap: () => context.router.push(const TrainingClothingRoute()),
            child: _buildServiceWear(ConstAssetsImages.trainingClothing, 'EĞİTİM GİYECEĞİ'),
          ),
          GestureDetector(
            onTap: () => context.router.push(ServiceWearRoute()),
            child: _buildServiceWear(ConstAssetsImages.serviceWear, 'HİZMET GİYECEĞİ'),
          ),
          GestureDetector(
            onTap: () => context.router.push(const StaffTaskClothingRoute()),
            child: _buildServiceWear(ConstAssetsImages.stafTaskClothing, 'KADRO GÖREV GİYECEĞİ'),
          ),
          /* GestureDetector(
            onTap: () => context.router.push(const ()),
            child: _buildServiceWear(ConstAssetsImages.coldClimateClothing, 'SOĞUK İKLİM'),
          ), */
        ],
      ),
    );
  }

  Widget _buildServiceWear(AssetImage assetsImages, String title) {
    return Stack(
      children: [
        Positioned(
          child: Container(
            width: double.infinity,
            margin: cardContainerMargin,
            height: cardContainerHeight,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  blurRadius: 10,
                  color: Color.fromARGB(248, 80, 154, 156),
                )
              ],
              color: Colors.blueGrey[600],
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        Positioned(
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
        ),
        Positioned(
          right: 0,
          bottom: 17,
          child: Container(
            width: 230,
            child: ListTile(
              title: Text(
                title,
                style: ConstTextStyle.categoriTextStyle.copyWith(fontSize: 14, color: Colors.white),
              ),
              subtitle: Text('Buraya açıklama girilecek'),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
            ),
          ),
        )
      ],
    );

    /* Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: InkWell(
        child: Container(
          alignment: Alignment.bottomCenter,
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            boxShadow: const <BoxShadow>[
              BoxShadow(blurRadius: 2, color: Colors.red, spreadRadius: 2),
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
        onTap: () async {
          await Get.toNamed(RouteName.serviceWearView);
          print('sayfadan dönüldü');
        },
      ),
    ); */
  }

  Widget _buildTrainingClothing(AssetImage assetsImages, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: InkWell(
        child: Container(
          alignment: Alignment.bottomCenter,
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            boxShadow: const <BoxShadow>[
              BoxShadow(blurRadius: 2, color: Colors.green, spreadRadius: 2),
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

  Widget _buildStafTaskClothing(AssetImage assetsImages, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: InkWell(
        child: Container(
          alignment: Alignment.bottomCenter,
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            boxShadow: const <BoxShadow>[BoxShadow(blurRadius: 2, color: Colors.blue, spreadRadius: 2)],
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
