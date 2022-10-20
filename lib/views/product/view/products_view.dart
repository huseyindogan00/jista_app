// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:jista/core/enums/view_state.dart';
import 'package:jista/core/router/auto_router/router.gr.dart';
import 'package:jista/core/services/service_result/firebase_service_result_model.dart';
import 'package:jista/data/constant/image/const_product_image.dart';
import 'package:jista/product/models/cart/cart_model.dart';
import 'package:jista/product/models/order/order_model.dart';
import 'package:jista/product/models/product/product_model.dart';
import 'package:jista/views/product/view_model/product_view_model.dart';

class ProductsView extends StatefulWidget {
  String productTypeName;

  ProductsView({Key? key, required this.productTypeName}) : super(key: key);

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> with AutoRouteAwareStateMixin {
  String winter = 'KIŞ';
  String summer = 'YAZ';
  String all = 'HEPSİ';
  String separator = '/';
  String productTypeName = '';
  TextStyle? filterTextStyle = Get.theme.textTheme.headline6?.copyWith(color: Get.theme.primaryColor, fontSize: 18);
  Color selectedColor = Get.theme.backgroundColor;
  Color unSelectedColor = Colors.white;
  //late FirebaseServiceResultModel<List<ProductModel>> serviceResultModel;

  BoxDecoration boxDecorationProductCard = BoxDecoration(
    color: const Color.fromARGB(255, 184, 180, 180),
    border: Border.all(color: const Color.fromARGB(255, 134, 132, 132)),
    boxShadow: const <BoxShadow>[BoxShadow(color: Color.fromARGB(255, 187, 185, 185), blurRadius: 3)],
    borderRadius: const BorderRadius.all(Radius.circular(15)),
  );

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
                        child: Text(
                          'Ürün listesi boş!',
                          style: Get.theme.textTheme.headline4,
                        ),
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
        itemCount: controller.serviceResultModel.value.data?.length,
        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 7),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.5, crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
        itemBuilder: (context, index) {
          ProductModel product = controller.serviceResultModel.value.data![index];
          return InkWell(
            onTap: () {
              context.router.push(ProductDetailsRoute(productModel: product));
            },
            child: Container(
              decoration: boxDecorationProductCard,
              child: Column(
                children: [
                  //_buildTypeText(product),
                  _buildImagePageView(),
                  _buildChipWidget(product),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildPointText(product),
                          _buildButtonCartAdd(product),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Expanded _buildImagePageView() {
    return Expanded(
      flex: 3,
      child: PageView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 5),
            child: const Image(
              image: NetworkImage(ConstProductImage.fakeImage),
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }

  Expanded _buildChipWidget(ProductModel product) {
    const TextStyle chipTextStyle =
        TextStyle(fontSize: 10, color: Color.fromARGB(255, 35, 34, 32), fontWeight: FontWeight.w700);
    return Expanded(
      flex: 2,
      child: Wrap(
        direction: Axis.horizontal,
        runAlignment: WrapAlignment.start,
        spacing: 10,
        runSpacing: 5,
        children: [
          SizedBox(
              height: 40,
              child: Chip(label: Text(product.season, style: chipTextStyle), labelPadding: const EdgeInsets.all(1))),
          SizedBox(
              height: 40,
              child: Chip(label: Text(product.gender, style: chipTextStyle), labelPadding: const EdgeInsets.all(1))),
          SizedBox(
              height: 40,
              child: Chip(label: Text(product.rank, style: chipTextStyle), labelPadding: const EdgeInsets.all(1))),
          SizedBox(
            height: 40,
            child: Chip(
                label: Text(product.cargoStatus ? 'Kargo Var' : 'Kargo Yok', style: chipTextStyle),
                labelPadding: const EdgeInsets.all(1)),
          ),
        ],
      ),
    );
  }

  Expanded _buildPointText(ProductModel product) {
    return Expanded(flex: 1, child: Text('${product.point} puan', style: const TextStyle(fontSize: 18)));
  }

  SizedBox _buildButtonCartAdd(ProductModel product) {
    return SizedBox(
      width: 60,
      height: 30,
      child: ElevatedButton(
        onPressed: () {
          ///************************************************************************
          /* ÜRÜN EKLEDİKTEN SONRA SEPETE EKLEME YAPMIYOR  */
          controller.cartItem.value.add(CartModel(productModel: product));
          Get.showSnackbar(
            const GetSnackBar(
              duration: Duration(seconds: 2),
              snackPosition: SnackPosition.TOP,
              message: 'Ürün Eklendi',
            ),
          );
        },
        child: const Icon(Icons.add_shopping_cart_outlined),
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

  ///***************************************** FİLTRELEME METHOTLARI  *********************************************
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
                label: Text(summer, style: filterTextStyle),
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
