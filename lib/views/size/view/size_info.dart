import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utility/appbarController/appbar_base_tabs_title.dart';
import '../../base/base_model.dart';

class SizeInfoView extends StatelessWidget {
  SizeInfoView({super.key}) {
    controller = Get.put(BaseModel());
    AppbarBaseTabsTitle.setAppTitle(2, controller);
  }

  late final controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Text('Beden ölçü bilgileri'),
    );
  }
}
