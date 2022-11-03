import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:jista/product/models/cart/cart_model.dart';
import 'package:jista/product/models/product/product_model.dart';
import 'package:jista/views/base/base_model.dart';
import 'package:jista/views/cart/view_model/cart_view_model.dart';
import 'package:jista/views/product/view_model/product_view_model.dart';

class ProductDetailsView extends StatelessWidget {
  ProductDetailsView({@PathParam() required this.productModel, super.key});

  dynamic productModel;

  var viewModel = Get.find<ProductViewModel>();

  final TextStyle textStyle =
      TextStyle(fontSize: 12, fontFamily: 'Montserrat', color: Colors.orange.shade900, fontWeight: FontWeight.bold);
  final TextStyle textStyleTitleType = const TextStyle(fontSize: 20, color: Colors.black, fontFamily: 'Montserrat');

  @override
  Widget build(BuildContext context) {
    ProductModel product = productModel;
    viewModel.size.value = '';
    viewModel.count.value = 1;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: const Color.fromARGB(255, 240, 239, 239),
          child: Column(
            children: [
              //********************************* IMAGE CONTAINERIN OLDUĞU YER  *********************************/
              _buildImageContainer(product),
              const Divider(),
              //********************************* TYPE VE TITLE YAZI ALANLARI  *********************************/
              _buildTypeAndTitle(product),
              const Divider(),
              //********************************* ÖZELLİKLER  *********************************/
              _buildFeatures(product),
              const Divider(),
              _buildSizeAndQuantity(),
              const Divider(),
              _buildPointAndCartAddButton(product)
            ],
          ),
        ),
      ),
    );
  }

  Stack _buildImageContainer(ProductModel product) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          height: 450,
          width: double.infinity,
          child: FadeInImage.assetNetwork(
            fit: BoxFit.contain,
            placeholder: '',
            image: product.imageUrl!,
          ),
        ),
        product.cargoStatus
            ? Positioned(
                top: 30,
                child: Container(
                  decoration: const BoxDecoration(color: Colors.orange, boxShadow: [BoxShadow(blurRadius: 1)]),
                  alignment: Alignment.center,
                  width: 60,
                  height: 30,
                  child: Text(
                    product.cargoStatus ? 'Kargo' : '',
                    style: textStyle.copyWith(fontSize: 15, color: Colors.white),
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }

  Widget _buildTypeAndTitle(ProductModel product) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 8, right: 20),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\t\t${product.type}\t\t',
                  style: textStyleTitleType.copyWith(fontWeight: FontWeight.w700),
                ),
                Container(
                  child: product.season == 'KIŞ'
                      ? const Icon(
                          Icons.severe_cold_sharp,
                          color: Color.fromARGB(248, 62, 72, 155),
                          size: 28,
                        )
                      : product.season == 'YAZ'
                          ? const Icon(
                              Icons.sunny,
                              color: Colors.amber,
                              size: 28,
                            )
                          : Row(
                              children: const <Widget>[
                                Icon(
                                  Icons.severe_cold_sharp,
                                  color: Color.fromARGB(248, 62, 72, 155),
                                  size: 28,
                                ),
                                Icon(
                                  Icons.sunny,
                                  color: Colors.amber,
                                  size: 28,
                                )
                              ],
                            ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              '\t\t\t${product.title} ',
              style: textStyleTitleType.copyWith(color: Colors.teal, fontSize: 15, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _buildFeatures(ProductModel product) {
    return SizedBox(
      height: 70,
      width: double.infinity,
      child: Wrap(
        spacing: 30,
        runAlignment: WrapAlignment.center,
        alignment: WrapAlignment.spaceEvenly,
        children: [
          Container(
            alignment: Alignment.center,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(5), color: const Color.fromARGB(151, 240, 187, 107)),
            padding: const EdgeInsets.all(5),
            width: 92,
            height: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Mevsim', style: textStyle),
                Text(
                  product.season,
                  style: textStyle.copyWith(color: Colors.black54, fontSize: 11),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(5), color: const Color.fromARGB(151, 240, 187, 107)),
            padding: EdgeInsets.all(5),
            width: 92,
            height: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Rütbe', style: textStyle),
                Text(
                  product.rank,
                  style: textStyle.copyWith(color: Colors.black54, fontSize: 11),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(5), color: const Color.fromARGB(151, 240, 187, 107)),
            padding: EdgeInsets.all(5),
            width: 92,
            height: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Cinsiyet', style: textStyle),
                Text(
                  product.gender == 'E/K'
                      ? 'ERKEK/KADIN'
                      : product.gender == 'E'
                          ? 'ERKEK'
                          : product.gender == 'K'
                              ? 'KADIN'
                              : 'Boş',
                  style: textStyle.copyWith(color: Colors.black54, fontSize: 11),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSizeAndQuantity() {
    double heightDropDownButton = 45;
    double widthDropDownButton = 125;
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(right: 5, left: 5),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 47, 138, 129),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const <BoxShadow>[BoxShadow(blurRadius: 1)],
            ),
            height: heightDropDownButton,
            width: widthDropDownButton,
            child: DropdownButtonFormField<String>(
              decoration: const InputDecoration(border: InputBorder.none, hintStyle: TextStyle(color: Colors.black)),
              borderRadius: BorderRadius.circular(10),
              dropdownColor: const Color.fromARGB(255, 36, 110, 103),
              isExpanded: true,
              hint: const Text(
                'Beden Seçin',
                style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w700),
              ),
              elevation: 20,
              style: textStyle.copyWith(color: Colors.white, fontSize: 17),
              items: const [
                DropdownMenuItem<String>(
                  alignment: AlignmentDirectional.center,
                  value: 'XLarge',
                  child: Text('XLarge'),
                ),
                DropdownMenuItem<String>(
                  alignment: AlignmentDirectional.center,
                  value: 'Large',
                  child: Text('Large'),
                ),
                DropdownMenuItem<String>(
                  alignment: AlignmentDirectional.center,
                  value: 'Medium',
                  child: Text('Medium'),
                ),
                DropdownMenuItem<String>(
                  alignment: AlignmentDirectional.center,
                  value: 'Small',
                  child: Text('Small'),
                ),
              ],
              onChanged: (value) {
                viewModel.size.value = value!;
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 5, top: 5),
            decoration: BoxDecoration(
                border: Border.all(width: 0.3, color: const Color.fromARGB(255, 161, 161, 161)),
                borderRadius: BorderRadius.circular(30)),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    viewModel.count.value <= 1 ? viewModel.count.value = 1 : viewModel.count.value--;
                  },
                  icon: const Icon(
                    Icons.remove_circle,
                    size: 32,
                    color: Colors.red,
                    shadows: [BoxShadow(blurRadius: 1)],
                  ),
                ),
                Obx(
                  () => SizedBox(
                    width: 40,
                    child: Center(
                      child: Text(
                        viewModel.count.value.toString(),
                        style: textStyle.copyWith(color: Colors.black, fontSize: 24),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    viewModel.count.value >= 2 ? viewModel.count.value = 2 : viewModel.count.value++;
                  },
                  icon: const Icon(
                    Icons.add_circle_outlined,
                    size: 32,
                    color: Colors.green,
                    shadows: [BoxShadow(blurRadius: 1)],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _buildPointAndCartAddButton(ProductModel product) {
    return Container(
      margin: const EdgeInsets.only(top: 30, bottom: 30),
      padding: const EdgeInsets.only(right: 15, left: 15),
      height: 50,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${product.point.toString()} Puan',
            style: textStyle.copyWith(fontSize: 26, color: Colors.red),
          ),
          GestureDetector(
            child: Container(
              alignment: Alignment.center,
              height: 50,
              width: 200,
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5, top: 5),
              decoration: const BoxDecoration(
                boxShadow: [BoxShadow(blurRadius: 2)],
                color: Colors.orange,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: const Text(
                'Sepete Ekle',
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            onTap: () {
              int productCount = viewModel.count.value;

              if (viewModel.size.value.isNotEmpty) {
                for (var cart in CartViewModel.cartListItem) {
                  if (cart.productModel.title == product.title) {
                    EasyLoading.showSuccess(
                      'Aynı ürün sepette mevcut',
                      dismissOnTap: false,
                      duration: const Duration(seconds: 2),
                    );
                    viewModel.size.value = '';
                    return;
                  }
                }
                CartViewModel().addToCart(CartModel(
                  productModel: product,
                  count: productCount,
                  size: viewModel.size.value,
                ));
                Get.find<BaseModel>().cartTotal.value = CartViewModel.cartListItem.length;
                EasyLoading.showSuccess(
                  'Kıyafet Eklendi',
                  dismissOnTap: false,
                  duration: const Duration(seconds: 1),
                );
                viewModel.size.value = '';
              } else {
                Get.showSnackbar(
                  const GetSnackBar(
                    duration: Duration(seconds: 1),
                    snackPosition: SnackPosition.BOTTOM,
                    message: 'Beden Seçiniz',
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
