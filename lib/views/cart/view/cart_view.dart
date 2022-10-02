import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jista/core/router/route_name.dart';
import 'package:jista/product/models/product/product_model.dart';
import 'package:jista/views/base/base_model.dart';
import 'package:jista/views/cart/view_model/cart_view_model.dart';
import 'package:jista/views/category_module/service_page/view_model/service_wear_view_model.dart';

class CartView extends StatefulWidget {
  CartView({
    super.key,
    this.productList,
  });

  List<ProductModel>? productList;

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildGridView(widget.productList!);
  }

  GridView _buildGridView(List<ProductModel> producList) {
    return GridView.builder(
      itemCount: producList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        var product = producList[index];
        return Hero(
          tag: product.id,
          child: InkWell(
            child: Wrap(
              spacing: 5,
              children: [
                Center(child: Text(product.type)),
                Container(
                    margin: const EdgeInsets.all(10),
                    child: const Image(image: AssetImage('assets/images/jandarma_logo.jpg'), fit: BoxFit.cover)),
                Text(product.title),
                Row(
                  children: [
                    Text(product.point.toString()),
                    TextButton(
                      onPressed: () {
                        /****************************************/
                        // SEPETE EKLEME YAPILACAK
                      },
                      child: Text(
                        'EKLE',
                        style: TextStyle(fontSize: 18, color: Colors.green.shade900),
                      ),
                    )
                  ],
                )
              ],
            ),
            onTap: () => Get.toNamed(RouteName.cartDetailsView, arguments: product),
          ),
        );
      },
    );
  }
}
