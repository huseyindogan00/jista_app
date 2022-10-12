import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductDetailView extends StatelessWidget {
  ProductDetailView({@PathParam() required this.productModel, super.key});

  dynamic productModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          textDirection: TextDirection.ltr,
          children: [
            Text(
              productModel.title,
            ),
            Container(
                margin: const EdgeInsets.all(20),
                child: const Image(
                    image: AssetImage('assets/images/jandarma_logo.jpg'),
                    fit: BoxFit.cover)),
            Text(productModel.title),
            OverflowBar(
              children: [
                Text(
                  productModel.point.toString(),
                ),
                TextButton(
                  onPressed: () {
                    /****************************************/
                    // SEPETE EKLEME YAPILACAK
                  },
                  child: Text(
                    'EKLE',
                    style:
                        TextStyle(fontSize: 18, color: Colors.green.shade900),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
