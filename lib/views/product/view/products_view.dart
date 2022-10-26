// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:jista/core/enums/view_state.dart';
import 'package:jista/core/services/service_result/firebase_service_result_model.dart';
import 'package:jista/data/constant/font/const_text_style.dart';
import 'package:jista/data/constant/image/const_product_image.dart';
import 'package:jista/data/constant/style/const_font_size.dart';
import 'package:jista/product/models/cart/cart_model.dart';
import 'package:jista/product/models/order/order_model.dart';
import 'package:jista/product/models/product/product_model.dart';
import 'package:jista/views/base/base_model.dart';
import 'package:jista/views/cart/view_model/cart_view_model.dart';
import 'package:jista/views/product/view_model/product_view_model.dart';

import '../../../core/router/auto_router/router.gr.dart';

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
  TextStyle? filterTextStyle = Get.theme.textTheme.headline6?.copyWith(color: Get.theme.primaryColor, fontSize: 18);
  Color selectedColor = Get.theme.backgroundColor;
  Color unSelectedColor = Colors.white;
  //late FirebaseServiceResultModel<List<ProductModel>> serviceResultModel;

  final controller = Get.put<ProductViewModel>(ProductViewModel());
  final _baseModelController = Get.put<BaseModel>(BaseModel());
  CartViewModel _cartViewModel = CartViewModel();

  final BoxDecoration _boxDecorationProductCard = const BoxDecoration(
    color: Color.fromARGB(255, 250, 247, 247),
  );
  final BoxDecoration _boxDecorationSubContainer = const BoxDecoration(
    boxShadow: [BoxShadow(blurRadius: 0.3)],
    color: Color.fromARGB(255, 161, 201, 201),
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(10),
      topRight: Radius.circular(10),
    ),
  );

  final BoxDecoration _boxDecorationChip = BoxDecoration(
    color: const Color.fromARGB(255, 17, 59, 80),
    borderRadius: const BorderRadius.all(Radius.circular(10)),
    border: Border.all(color: const Color.fromARGB(255, 17, 59, 80)),
    boxShadow: const [BoxShadow(blurRadius: 1)],
  );

  final _chipTextStyle = const TextStyle(fontSize: 11, color: Colors.white, fontWeight: FontWeight.w700);
  final _chipLabelPadding = const EdgeInsets.all(5);

  final BoxDecoration _boxDecorationImageCard = const BoxDecoration(
      color: Color.fromARGB(255, 250, 247, 247),
      borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)));

  final _pointTextStyle =
      const TextStyle(fontSize: 19, color: Color.fromARGB(255, 143, 26, 13), fontWeight: FontWeight.w600);
  final _titleTextStyle = Get.theme.textTheme.bodySmall?.copyWith(
      fontFamily: ConstTextStyle.fontFamilyMontserrat, color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16);

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
        const SizedBox(height: 10),
        _buildRowFilter(),
        const SizedBox(height: 10),
        Obx(
          () => controller.viewState == ViewState.BUSY
              ? const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : controller.serviceResultModel.value.isSuccess == false
                  ? Center(
                      child: Container(
                        color: Colors.transparent,
                        child: Text('Ürün listesi boş!', style: Get.theme.textTheme.headline4),
                      ),
                    )
                  : _buildGridViewProducts(),
        ),
      ],
    );
  }

  Widget _buildGridViewProducts() {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: controller.serviceResultModel.value.data?.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.6,
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (context, index) {
          ProductModel product = controller.serviceResultModel.value.data![index];
          return Container(
            decoration: _boxDecorationProductCard,
            child: Column(
              children: [
                //_buildTypeText(product),
                _buildImagePageView(product),
                Expanded(
                  flex: 5,
                  child: Container(
                    decoration: _boxDecorationSubContainer,
                    width: double.infinity,
                    child: Column(
                      children: [
                        _buildTitle(product),
                        //_buildChipWidget(product),
                        //_buildSizeAndQuantity(),
                        _buildSeasonAndPoint(product),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Expanded _buildImagePageView(ProductModel product) {
    return Expanded(
      flex: 5,
      child: Stack(
        children: [
          InkWell(
            onTap: () => context.router.push(ProductDetailsRoute(productModel: product)),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: _boxDecorationImageCard,
              padding: const EdgeInsets.only(bottom: 5),
              child: const FadeInImage(
                placeholder: AssetImage('assets/images/jandarma_logo.png'),
                image: NetworkImage(ConstProductImage.fakeImage),
              ),
            ),
          ),
          product.cargoStatus
              ? Positioned(
                  top: 0,
                  left: 8,
                  child: Container(
                    width: 20,
                    height: 25,
                    decoration: const BoxDecoration(
                      boxShadow: [BoxShadow(blurRadius: 3)],
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(2), bottomLeft: Radius.circular(2)),
                      color: Colors.amber,
                    ),
                    child: const Icon(
                      Icons.local_shipping_outlined,
                      size: 17,
                      color: Color.fromARGB(255, 136, 9, 9),
                    ),
                  ),
                )
              : const SizedBox(),
          const Positioned(
            top: 2,
            right: 5,
            child: Icon(
              Icons.search,
              color: Color.fromARGB(255, 94, 25, 20),
              size: 25,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(ProductModel product) {
    return Expanded(
      flex: 6,
      child: Container(
        padding: const EdgeInsets.only(right: 3, left: 3),
        alignment: Alignment.centerLeft,
        child: Text(product.title, style: _titleTextStyle),
      ),
    );
  }

  /* Expanded _buildChipWidget(ProductModel product) {
    return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: _chipLabelPadding,
            decoration: _boxDecorationChip,
            child: Text(
              product.season,
              style: _chipTextStyle,
            ),
          ),
          Container(
            padding: _chipLabelPadding,
            decoration: _boxDecorationChip,
            child: Text(
              product.gender,
              style: _chipTextStyle,
            ),
          ),
          Container(
            padding: _chipLabelPadding,
            decoration: _boxDecorationChip,
            child: Text(product.rank, style: _chipTextStyle),
          ),
        ],
      ),
    );
  } */

  Widget _buildSeasonAndPoint(ProductModel product) {
    return Expanded(
      flex: 4,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ..._buildSeasonIcon(product),
            _buildPointText(product),
          ],
        ),
      ),
    );
  }

  _buildSeasonIcon(ProductModel product) {
    switch (product.season) {
      case 'KIŞ':
        return const [
          Icon(
            Icons.severe_cold_sharp,
            color: Colors.cyan,
            size: 22,
          )
        ];
      case 'YAZ':
        return const [
          Icon(
            Icons.sunny,
            color: Colors.amber,
            size: 22,
          )
        ];
      case 'KIŞ/YAZ':
      case 'YAZ/KIŞ':
        return [
          const Icon(
            Icons.severe_cold_sharp,
            color: Colors.cyan,
            size: 22,
          ),
          const Icon(
            Icons.sunny,
            color: Colors.amber,
            size: 22,
          )
        ];
    }
  }

  /* Row _buildSizeAndQuantity() {
    double heightDropDownButton = 35;
    double widthDropDownButton = 60;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          height: heightDropDownButton,
          width: widthDropDownButton,
          child: DropdownButton<String>(
            value: 'data',
            items: const [
              DropdownMenuItem<String>(
                value: 'data',
                child: Text(
                  'data',
                  style: TextStyle(fontSize: 10, color: Colors.black),
                ),
              ),
              DropdownMenuItem<String>(
                value: 'data1',
                child: Text(
                  'data1',
                  style: TextStyle(fontSize: 10, color: Colors.black),
                ),
              ),
              DropdownMenuItem<String>(
                value: 'data2',
                child: Text(
                  'data2',
                  style: TextStyle(fontSize: 10, color: Colors.black),
                ),
              ),
            ],
            onChanged: (value) {},
          ),
        ),
        SizedBox(
          height: heightDropDownButton,
          width: widthDropDownButton,
          child: DropdownButton<String>(
            value: 'data',
            items: const [
              DropdownMenuItem<String>(
                value: 'data',
                child: Text(
                  'data',
                  style: TextStyle(fontSize: 10, color: Colors.black),
                ),
              ),
              DropdownMenuItem<String>(
                value: 'data1',
                child: Text(
                  'data1',
                  style: TextStyle(fontSize: 10, color: Colors.black),
                ),
              ),
              DropdownMenuItem<String>(
                value: 'data2',
                child: Text(
                  'data2',
                  style: TextStyle(fontSize: 10, color: Colors.black),
                ),
              ),
            ],
            onChanged: (value) {},
          ),
        ),
      ],
    );
  } */

  Expanded _buildPointText(ProductModel product) {
    return Expanded(
      flex: 1,
      child: Text('${product.point} Puan', style: _pointTextStyle),
    );
  }

  /* SizedBox _buildButtonCartAdd(ProductModel product) {
    return SizedBox(
      width: 50,
      height: 25,
      child: ElevatedButton(
        onPressed: () { 
          CartViewModel.cartListItem.add(CartModel(productModel: product));
          _baseModelController.cartTotal.value = CartViewModel.cartListItem.length; 
          Get.showSnackbar(
            const GetSnackBar(
              duration: Duration(seconds: 1),
              snackPosition: SnackPosition.BOTTOM,
              message: 'Ürün Eklendi',
            ),
          );
        },
        child: const Icon(
          Icons.add_shopping_cart_outlined,
          size: 20,
        ),
      ),
    );
  } */

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

  ///***************************************** FİLTRELEME METHOTLARI  *********************************************
  Widget _buildRowFilter() {
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
                elevation: 1,
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
                label: Text(winter, style: filterTextStyle),
                elevation: 1,
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
                label: Text(summer, style: filterTextStyle),
                elevation: 1,
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
}
