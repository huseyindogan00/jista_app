// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:jista/core/enums/view_state.dart';
import 'package:jista/data/constant/type/type_name.dart';
import 'package:jista/product/models/person/person_model.dart';
import 'package:jista/product/models/product/product_model.dart';
import 'package:jista/views/base/base_view.dart';
import 'package:jista/views/cart/view/cart_view.dart';
import 'package:jista/views/cart/view_model/cart_view_model.dart';
import 'package:jista/views/category_module/service_page/view_model/service_wear_view_model.dart';

class ServiceWearView extends StatefulWidget {
  PersonModel? personModel;

  ServiceWearView({
    Key? key,
    this.personModel,
  }) : super(key: key);

  @override
  State<ServiceWearView> createState() => _ServiceWearViewState();
}

class _ServiceWearViewState extends State<ServiceWearView> {
  String winter = 'KIŞ';
  String summer = 'YAZ';
  String all = 'HEPSİ';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<ServiceWearViewModel>(
      appTitle: 'Hizmet Kıyafeti',
      onBuilderProductModel: (model) async {
        model.getToProduct(TypeName.hizmetGiyecegi);
      },
      onBuilder: (context, model, productList) {
        return CartView(productList: productList!);
        /* Column(
          children: [
            _buildRowFilter(model),
            CartView(productList: productList!),
          ],
        ) 
        ;*/
      },
    );
  }

  Row _buildRowFilter(ServiceWearViewModel model) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Obx(
          () {
            return InkWell(
              child: Chip(
                label: Text(all),
                elevation: 2,
                backgroundColor: model.isAll.value ? Colors.amber.shade700 : Colors.white,
              ),
              onTap: () {},
            );
          },
        ),
        Obx(
          () {
            return InkWell(
              child: Chip(
                label: Text(winter),
                elevation: 2,
                backgroundColor: model.isWinter.value ? Colors.amber.shade700 : Colors.white,
              ),
              onTap: () {},
            );
          },
        ),
        Obx(
          () {
            return InkWell(
              child: Chip(
                label: Text(summer),
                elevation: 2,
                backgroundColor: model.isSummer.value ? Colors.amber.shade700 : Colors.white,
              ),
              onTap: () {},
            );
          },
        ),
      ],
    );
  }
}
