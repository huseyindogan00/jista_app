import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jista/core/router/route_name.dart';
import 'package:jista/product/models/product/product_model.dart';

class ProductView extends StatefulWidget {
  ProductView({
    super.key,
    this.productList,
  });

  List<ProductModel>? productList;

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildGridView(widget.productList!);
  }

  Widget _buildGridView(List<ProductModel> producList) {
    return producList.isNotEmpty
        ? GridView.builder(
            itemCount: producList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              var product = producList[index];
              return Container(
                color: Colors.grey,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                child: InkWell(
                  onTap: () => Get.toNamed(RouteName.cartDetailsView,
                      arguments: product),
                  child: Column(
                    children: [
                      Expanded(
                          child: Center(
                              child: Text(
                        product.type,
                        style: const TextStyle(fontSize: 10),
                      ))),
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
          )
        : const Center(child: Text('Ürün Listesi Boş'));
  }
}
