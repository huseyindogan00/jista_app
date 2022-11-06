import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jista/data/constant/appbar_text/appbar_title.dart';
import 'package:jista/product/widget/my_appbar_widget.dart';
import 'package:jista/product/widget/navigation_drawer_widget.dart';
import 'package:jista/views/base/base_model.dart';

class RationRequestPeriodView extends StatelessWidget {
  RationRequestPeriodView({super.key});

  late final controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbarWiget.createAppbar(title: AppbarTitle.periodPageTitle).getAppBar(context),
      drawer: NavigationDrawer(),
      body: Container(
        child: Text('data'),
      ),
    );
  }
}
