import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jista/product/models/product/product_model.dart';

class CartDetailsView extends StatelessWidget {
  CartDetailsView({super.key});

  ProductModel product = Get.arguments ?? [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        systemOverlayStyle: const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
        title: Text(product.title),
      ),
      body: Hero(
        tag: product.id,
        child: Expanded(
          child: SizedBox(
            child: Column(
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
          ),
        ),
      ),
    );
  }
}
