// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jista/core/router/route_name.dart';
import 'package:jista/data/constant/appbar_text/appbar_title.dart';
import 'package:jista/data/constant/font/const_text_style.dart';
import 'package:jista/views/base/base_view.dart';
import 'package:jista/views/home/view_model/home_view_model.dart';

import '../../../data/constant/const_assets_images.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      appTitle: AppbarTitle.homePageTitle,
      onBuilder: (context, model, productList) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildServiceWear(
                  ConstAssetsImages.serviceWear, 'Hizmet Giyeceği'),
              _buildTrainingClothing(
                  ConstAssetsImages.trainingClothing, 'Eğitim Giyeceği'),
              _buildStafTaskClothing(
                  ConstAssetsImages.stafTaskClothing, 'Kadro Görev Kıyafeti'),
            ],
          ),
        );
      },
    );
  }

  Widget _buildServiceWear(AssetImage assetsImages, String title) {
    return Padding(
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
    );
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
            boxShadow: const <BoxShadow>[
              BoxShadow(blurRadius: 2, color: Colors.blue, spreadRadius: 2)
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
