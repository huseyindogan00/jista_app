// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jista/views/home/view_model/home_view_model.dart';
import 'package:jista/views/main/view_model/main_view_model.dart';

class ServiceWearView extends StatelessWidget {
  ServiceWearView({super.key});

  HomeViewModel homeCtrl = Get.find<HomeViewModel>();
  MainViewModel mainCtrl = Get.find<MainViewModel>();

  @override
  Widget build(BuildContext context) {
    _buildAppbarLeadin(true);
    return Container(
      alignment: Alignment.center,
      color: Colors.amber,
      child: ElevatedButton(
        onPressed: () => homeCtrl.categoryIndex.value = 0,
        child: const Text('Home sayfasına geri gel'),
      ),
    );
  }

  void _buildAppbarLeadin(bool value) {
    mainCtrl.changeAppbarLeading(value);
  }
} 















/* class ServiceWearView extends StatefulWidget {
  const ServiceWearView({super.key});

  @override
  State<ServiceWearView> createState() => _ServiceWearViewState();
}

class _ServiceWearViewState extends State<ServiceWearView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Hizmet kıyafetleri'),
      alignment: Alignment.center,
      color: Colors.amber,
    );
  }
} */
