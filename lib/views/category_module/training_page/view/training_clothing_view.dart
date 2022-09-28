import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../home/view_model/home_view_model.dart';

class TrainingClothingView extends StatelessWidget {
  TrainingClothingView({super.key});

  HomeViewModel ctrl = Get.find<HomeViewModel>();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.greenAccent,
      child: ElevatedButton(
        onPressed: () => ctrl.categoryIndex.value = 0,
        child: const Text('Home sayfasına geri gel'),
      ),
    );
  }
}
