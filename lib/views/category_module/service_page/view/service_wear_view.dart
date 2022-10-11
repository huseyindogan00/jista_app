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
import 'package:jista/views/products/view/product_view.dart';
import 'package:jista/views/products/view_model/product_view_model.dart';
import 'package:jista/views/category_module/service_page/view_model/service_wear_view_model.dart';

class ServiceWearView extends StatefulWidget {
  ServiceWearView({
    Key? key,
  }) : super(key: key);

  @override
  State<ServiceWearView> createState() => _ServiceWearViewState();
}

class _ServiceWearViewState extends State<ServiceWearView> {
  String winter = 'KIŞ';
  String summer = 'YAZ';
  String all = 'HEPSİ';
  List<ProductModel>? producList;

  final controller = Get.put<ServiceWearViewModel>(ServiceWearViewModel());

  @override
  void initState() {
    super.initState();
    getProduct();
  }

  getProduct() async {
    producList = await controller.getToProduct(TypeName.hizmetGiyecegi);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildRowFilter(controller),
        Expanded(
          child: GridView.builder(
            itemCount: producList?.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              var product = producList![index];
              return InkWell(
                onTap: () {},
                child: Container(
                  color: Colors.grey,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            product.type,
                            style: const TextStyle(fontSize: 10),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          child: const Image(
                            image:
                                AssetImage('assets/images/jandarma_logo.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                          child: Text(product.title,
                              style: TextStyle(fontSize: 10))),
                      Row(
                        children: [
                          Expanded(
                              child: Text(product.point.toString(),
                                  style: TextStyle(fontSize: 10))),
                          Container(
                            width: 60,
                            height: 20,
                            child: ElevatedButton(
                              onPressed: () {
                                /****************************************/
                                // SEPETE EKLEME YAPILACAK
                              },
                              child: Text('EKLE',
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.green.shade900)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Row _buildRowFilter(ServiceWearViewModel ctrl) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text('Filtrele :'),
        Obx(
          () {
            return InkWell(
              child: Chip(
                label: Text(all),
                elevation: 2,
                backgroundColor:
                    ctrl.isAll.value ? Colors.amber.shade700 : Colors.white,
              ),
              onTap: () {
                ctrl.isAll.value = !ctrl.isAll.value;
                addFilterList(ctrl, all);
              },
            );
          },
        ),
        Obx(
          () {
            return InkWell(
              child: Chip(
                label: Text(winter),
                elevation: 2,
                backgroundColor:
                    ctrl.isWinter.value ? Colors.amber.shade700 : Colors.white,
              ),
              onTap: () {
                ctrl.isWinter.value = !ctrl.isWinter.value;
                addFilterList(ctrl, winter);
              },
            );
          },
        ),
        Obx(
          () {
            return InkWell(
              child: Chip(
                label: Text(summer),
                elevation: 10,
                backgroundColor:
                    ctrl.isSummer.value ? Colors.amber.shade700 : Colors.white,
              ),
              onTap: () {
                ctrl.isSummer.value = !ctrl.isSummer.value;
                addFilterList(ctrl, summer);
              },
            );
          },
        ),
      ],
    );
  }

  void addFilterList(ServiceWearViewModel ctrl, String filterName) {
    switch (filterName) {
      case 'HEPSİ':
        if (ctrl.isSummer.value || ctrl.isWinter.value) {
          ctrl.filterList.clear();
          ctrl.filterList.add(all);
          ctrl.isSummer.value = false;
          ctrl.isWinter.value = false;
        } else {
          ctrl.isAll.value
              ? ctrl.filterList.add(summer)
              : ctrl.filterList.remove(all);
        }

        break;
      case 'KIŞ':
        if (ctrl.isAll.value) {
          ctrl.isAll.value = false;
        }
        ctrl.isWinter.value
            ? ctrl.filterList.add(all)
            : ctrl.filterList.contains(all)
                ? ctrl.filterList.remove(all)
                : false;

        break;
      case 'YAZ':
        ctrl.isSummer.value
            ? ctrl.filterList.add(all)
            : ctrl.filterList.contains(all)
                ? ctrl.filterList.remove(all)
                : false;

        break;
    }

    print(ctrl.filterList.length);
  }
}
