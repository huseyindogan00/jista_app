import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jista/core/utility/appbarController/appbar_base_tabs_title.dart';
import 'package:jista/views/base/base_model.dart';

class RationRequestPeriodView extends StatelessWidget {
  RationRequestPeriodView({super.key}) {
    controller = Get.put(BaseModel());
    setAppbarTitle();
  }

  static late final controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('İstek Dönemi'),
      alignment: Alignment.center,
    );
  }

  void setAppbarTitle() {
    AppbarBaseTabsTitle.setAppTitle(3, controller);
  }
}
