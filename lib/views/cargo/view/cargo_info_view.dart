import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jista/core/utility/internet_connection_control.dart';
import 'package:jista/views/cargo/view_model/cargo_info_view_model.dart';

class CargoInfoView extends StatelessWidget {
  CargoInfoView({super.key});

  InternetConnectionControl connection = InternetConnectionControl();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network('https://picsum.photos/200'),
    );
  }
}
