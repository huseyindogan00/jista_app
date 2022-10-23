import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:jista/product/models/product/product_model.dart';

class ProductDetailsView extends StatelessWidget {
  ProductDetailsView({@PathParam() required this.productModel, super.key});

  dynamic productModel;

  @override
  Widget build(BuildContext context) {
    ProductModel product = productModel;
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.grey,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            textDirection: TextDirection.ltr,
            children: [
              Text(product.title),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(20),
                  child: const Image(
                      image: NetworkImage(
                          'https://firebasestorage.googleapis.com/v0/b/jista-81374.appspot.com/o/hizmet_kiyafeti%2Fhizmet_kiyafeti.png?alt=media&token=ff60b28b-7be1-47d2-96da-89000721d5b7'),
                      fit: BoxFit.cover),
                ),
              ),
              Text(product.title),
              OverflowBar(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
