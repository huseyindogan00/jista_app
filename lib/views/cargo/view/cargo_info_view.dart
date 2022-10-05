import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jista/views/cargo/view_model/cargo_info_view_model.dart';

class CargoInfoView extends StatelessWidget {
  const CargoInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CargoInfoViewModel());
    return Container(
      child: Text('data'),
    );
  }
}
