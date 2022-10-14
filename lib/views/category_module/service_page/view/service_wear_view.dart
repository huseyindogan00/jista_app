// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jista/core/enums/view_state.dart';
import 'package:jista/core/router/auto_router/router.gr.dart';
import 'package:jista/core/services/service_result/firebase_service_result_model.dart';
import 'package:jista/data/constant/type/type_name.dart';
import 'package:jista/product/models/product/product_model.dart';
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
  late FirebaseServiceResultModel<List<ProductModel>> serviceResultModel;

  final controller = Get.put<ServiceWearViewModel>(ServiceWearViewModel());

  @override
  void initState() {
    super.initState();
    getProduct();
  }

  getProduct() {
    controller
        .getToProduct(TypeName.hizmetGiyecegi)
        .then<FirebaseServiceResultModel<List<ProductModel>>?>((serviceResult) {
      serviceResultModel = serviceResult!;
      controller.productList.value = serviceResult.data!;
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.viewState == ViewState.Busy
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Column(
            children: [
              _buildRowFilter(controller),
              Expanded(
                child: GridView.builder(
                  itemCount: controller.productList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    var product = controller.productList[index];
                    return InkWell(
                      onTap: () {
                        context.router.push(
                          ProductDetailRoute(productModel: product),
                        );
                      },
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
                                  image: AssetImage(
                                      'assets/images/jandarma_logo.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                                child: Text(product.title,
                                    style: const TextStyle(fontSize: 10))),
                            Row(
                              children: [
                                Expanded(
                                    child: Text(product.point.toString(),
                                        style: const TextStyle(fontSize: 10))),
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
          ));
  }

  Row _buildRowFilter(ServiceWearViewModel ctrl) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          'Filtre   :',
          style: Get.theme.textTheme.headline6,
        ),
        Obx(
          () {
            return InkWell(
              child: Chip(
                label: Text(all),
                elevation: 3,
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
                elevation: 3,
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
                elevation: 3,
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
