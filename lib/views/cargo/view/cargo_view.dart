import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jista/data/constant/appbar_text/appbar_title.dart';
import 'package:jista/product/widget/my_appbar_widget.dart';

class CargoView extends StatelessWidget {
  const CargoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbarWiget.createAppbar(title: AppbarTitle.cargoPageTitle).getAppBar(context),
    );
  }
}
