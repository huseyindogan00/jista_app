// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jista/data/constant/font/const_text_style.dart';
import 'package:jista/views/category_module/service_page/view/service_wear_view.dart';
import 'package:jista/views/category_module/staff_page/view/staff_task_clothing_view.dart';
import 'package:jista/views/category_module/training_page/view/training_clothing_view.dart';
import 'package:jista/views/home/vm/home_view_model.dart';
import 'package:jista/views/main/vm/main_view_model.dart';

import '../../../data/constant/const_assets_images.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  Key key1 = const Key('hizmet_giyecegi');
  Key key2 = const Key('egitim_giyecegi');
  Key key3 = const Key('kadro_gorev_giyecegi');

  HomeViewModel homeController = Get.put(HomeViewModel());
  MainViewModel mainController = Get.find<MainViewModel>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        switch (homeController.categoryIndex.value) {
          case 0:
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCategory(ConstAssetsImages.serviceWear, 'Hizmet Kıyafeti', key1),
                  _buildCategory(ConstAssetsImages.trainingClothing, 'Eğitim Kıyafeti', key2),
                  _buildCategory(ConstAssetsImages.stafTaskClothing, 'Kadro Görev Kıyafeti', key3),
                ],
              ),
            );
          case 1:
            return ServiceWearView();
          case 2:
            return TrainingClothingView();
          case 3:
            return StaffTaskClothingView();
          default:
            return Text(homeController.categoryIndex.value.toString());
        }
      },
    );
  }

  Widget _buildCategory(AssetImage assetsImages, String title, Key key) {
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
              BoxShadow(blurRadius: 2, color: Colors.blue, spreadRadius: 1)
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
        onTap: () {
          String value = key.toString().substring(3, key.toString().lastIndexOf('\''));
          switch (value) {
            case 'hizmet_giyecegi':
              homeController.getCategory(1);
              mainController.changeAppbarLeading(true);
              break;
            case 'egitim_giyecegi':
              homeController.getCategory(2);
              break;
            case 'kadro_gorev_giyecegi':
              homeController.getCategory(3);
              break;
          }
        },
      ),
    );
  }
}
