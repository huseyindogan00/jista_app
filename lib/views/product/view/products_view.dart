// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jista/core/enums/view_state.dart';
import 'package:jista/core/router/auto_router/router.gr.dart';
import 'package:jista/core/services/service_result/firebase_service_result_model.dart';
import 'package:jista/product/models/product/product_model.dart';
import 'package:jista/views/product/view_model/product_view_model.dart';

class ProductsView extends StatefulWidget {
  String productTypeName;

  ProductsView({Key? key, required this.productTypeName}) : super(key: key);

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  String winter = 'KIŞ';
  String summer = 'YAZ';
  String all = 'HEPSİ';
  String separator = '/';
  String productTypeName = '';
  TextStyle? textStyle = Get.theme.textTheme.headline6?.copyWith(color: Get.theme.primaryColor);
  Color selectedColor = Get.theme.backgroundColor;
  Color unSelectedColor = Colors.white;
  //late FirebaseServiceResultModel<List<ProductModel>> serviceResultModel;

  final controller = Get.put<ProductViewModel>(ProductViewModel());

  @override
  void initState() {
    super.initState();
    controller.isAll.value = true;
    controller.isSummer.value = false;
    controller.isWinter.value = false;
    productTypeName = widget.productTypeName;
    getAllProduct(productTypeName);
  }

  getAllProduct(String productTypeName) {
    controller.getAllProduct(productTypeName).then<FirebaseServiceResultModel<List<ProductModel>>?>((serviceResult) {
      controller.serviceResultModel.value = serviceResult!;
      return null;
    });
    return null;
    //controller.serviceResultModel.value = serviceResult!;
  }

  getFilterProduct(String seasonName) {
    controller
        .getFilterProducts(seasonName, productTypeName)
        .then<FirebaseServiceResultModel<List<ProductModel>>?>((serviceResult) {
      controller.serviceResultModel.value = serviceResult!;
      return null;
    });
    return null;
    //controller.serviceResultModel.value = serviceResult!;
  }

  getFilter(String seasonFilter) {
    List<ProductModel> productFilter = [];
    for (var product in controller.serviceResultModel.value.data!) {
      if (product.season == seasonFilter) {
        productFilter.add(product);
      }
    }
    controller.serviceResultModel.value.data = productFilter;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildRowFilter(),
        Expanded(
          child: Obx(
            () => controller.viewState == ViewState.BUSY
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : controller.serviceResultModel.value.isSuccess == false
                    ? Center(
                        child: Container(
                          color: Colors.transparent,
                          child: Text(
                            'Ürün listesi boş!',
                            style: Get.theme.textTheme.headline4,
                          ),
                        ),
                      )
                    : Column(
                        children: [
                          _buildProducts(),
                        ],
                      ),
          ),
        ),
      ],
    );
  }

  Widget _buildProducts() {
    return Expanded(
      child: GridView.builder(
        itemCount: controller.serviceResultModel.value.data?.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          var product = controller.serviceResultModel.value.data![index];
          return InkWell(
            onTap: () {
              context.router.push(ProductDetailRoute(productModel: product));
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
                        image: AssetImage('assets/images/jandarma_logo.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(child: Text(product.season, style: const TextStyle(fontSize: 10))),
                  Row(
                    children: [
                      Expanded(child: Text(product.point.toString(), style: const TextStyle(fontSize: 10))),
                      SizedBox(
                        width: 60,
                        height: 20,
                        child: ElevatedButton(
                          onPressed: () {
                            /****************************************/
                            // SEPETE EKLEME YAPILACAK
                          },
                          child: Text('EKLE', style: TextStyle(fontSize: 10, color: Colors.green.shade900)),
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
    );
  }

  Row _buildRowFilter() {
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
                label: Text(all, style: textStyle),
                elevation: 3,
                backgroundColor: controller.isAll.value ? selectedColor : unSelectedColor,
              ),
              onTap: () {
                controller.isAll.value = !controller.isAll.value;
                controller.seasonFilter = '$summer$separator$winter';
                controller.isSummer.value = false;
                controller.isWinter.value = false;
                getAllProduct(productTypeName);
              },
            );
          },
        ),
        Obx(
          () {
            return InkWell(
              child: Chip(
                label: Text(winter, style: textStyle),
                elevation: 3,
                backgroundColor: controller.isWinter.value ? selectedColor : unSelectedColor,
              ),
              onTap: () {
                controller.isWinter.value = !controller.isWinter.value;
                controller.seasonFilter = winter;
                controller.isAll.value = false;
                controller.isSummer.value = false;
                if (!controller.isWinter.value) {
                  getAllProduct(productTypeName);

                  return;
                }
                getFilterProduct(controller.seasonFilter);
              },
            );
          },
        ),
        Obx(
          () {
            return InkWell(
              child: Chip(
                label: Text(summer, style: textStyle),
                elevation: 3,
                backgroundColor: controller.isSummer.value ? selectedColor : unSelectedColor,
              ),
              onTap: () {
                controller.isSummer.value = !controller.isSummer.value;
                controller.seasonFilter = summer;
                controller.isAll.value = false;
                controller.isWinter.value = false;
                if (!controller.isSummer.value) {
                  getAllProduct(productTypeName);
                  return;
                }
                getFilterProduct(controller.seasonFilter);
              },
            );
          },
        ),
      ],
    );
  }
}
