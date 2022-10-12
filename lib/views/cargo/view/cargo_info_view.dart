import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jista/core/utility/internet_connection_control.dart';

import '../../../core/utility/appbarController/appbar_base_tabs_title.dart';
import '../../base/base_model.dart';

class CargoInfoView extends StatelessWidget {
  CargoInfoView({super.key}) {
    controller = Get.put<BaseModel>(BaseModel());
    AppbarBaseTabsTitle.setAppTitle(1, controller);
  }

  late final controller;
  InternetConnectionControl connection = InternetConnectionControl();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network('https://picsum.photos/200'),
    );
  }
}
