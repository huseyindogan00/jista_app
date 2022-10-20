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

class _ProductsViewState extends State<ProductsView>
    with AutoRouteAwareStateMixin {
  String winter = 'KIŞ';
  String summer = 'YAZ';
  String all = 'HEPSİ';
  String separator = '/';
  String productTypeName = '';
  TextStyle? filterTextStyle = Get.theme.textTheme.headline6
      ?.copyWith(color: Get.theme.primaryColor, fontSize: 18);
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
                          _buildGridViewProducts(),
                        ],
                      ),
          ),
        ),
      ],
    );
  }

  Widget _buildGridViewProducts() {
    return Expanded(
      child: GridView.builder(
        itemCount: controller.serviceResultModel.value.data?.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.5, crossAxisCount: 2),
        itemBuilder: (context, index) {
          ProductModel product =
              controller.serviceResultModel.value.data![index];
          print('product sayfasında olan id-----------> ${product.id} ');
          return InkWell(
            onTap: () {
              context.router.push(ProductDetailsRoute(productModel: product));
            },
            child: Container(
              color: Colors.grey,
              //padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  //_buildTypeText(product),
                  _buildImage(),
                  _buildChipWidget(product),
                  Row(
                    children: [
                      _buildPointText(product),
                      _buildButtonCartAdd(),
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

  SizedBox _buildButtonCartAdd() {
    return SizedBox(
      width: 60,
      height: 20,
      child: ElevatedButton(
        onPressed: () {
          /****************************************/
          // SEPETE EKLEME YAPILACAK
        },
        child: Text('EKLE',
            style: TextStyle(fontSize: 10, color: Colors.green.shade900)),
      ),
    );
  }

  Expanded _buildPointText(ProductModel product) {
    return Expanded(
        flex: 1,
        child: Text('${product.point} puan',
            style: const TextStyle(fontSize: 18)));
  }

  Expanded _buildChipWidget(ProductModel product) {
    const TextStyle chipTextStyle =
        TextStyle(fontSize: 10, color: Color.fromARGB(255, 35, 34, 32));
    return Expanded(
      flex: 2,
      child: Wrap(
        children: [
          Chip(label: Text(product.season, style: chipTextStyle)),
          Chip(label: Text(product.gender, style: chipTextStyle)),
          Chip(label: Text(product.rank, style: chipTextStyle)),
          Chip(
              label: Text(
                  product.cargoStatus ? 'Kargo var' : 'Kargo Gönderimi Yok',
                  style: chipTextStyle)),
        ],
      ),
    );
  }

  Expanded _buildImage() {
    return Expanded(
      flex: 4,
      child: Container(
        padding: EdgeInsets.only(top: 2, bottom: 5),
        child: const Image( ,
          image: NetworkImage(
              'https://firebasestorage.googleapis.com/v0/b/jista-81374.appspot.com/o/hizmet_kiyafeti%2Fhizmet_kiyafeti.png?alt=media&token=ff60b28b-7be1-47d2-96da-89000721d5b7'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Expanded _buildTypeText(ProductModel product) {
    return Expanded(
      child: Center(
        child: Text(
          product.type,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  getAllProduct(String productTypeName) {
    controller
        .getAllProduct(productTypeName)
        .then<FirebaseServiceResultModel<List<ProductModel>>?>((serviceResult) {
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
                label: Text(all, style: filterTextStyle),
                elevation: 3,
                backgroundColor:
                    controller.isAll.value ? selectedColor : unSelectedColor,
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
                label: Text(winter, style: filterTextStyle),
                elevation: 3,
                backgroundColor:
                    controller.isWinter.value ? selectedColor : unSelectedColor,
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
                label: Text(summer, style: filterTextStyle),
                elevation: 3,
                backgroundColor:
                    controller.isSummer.value ? selectedColor : unSelectedColor,
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
