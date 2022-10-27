import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:jista/product/models/product/product_model.dart';

class ProductDetailsView extends StatelessWidget {
  ProductDetailsView({@PathParam() required this.productModel, super.key});

  dynamic productModel;

  @override
  Widget build(BuildContext context) {
    ProductModel product = productModel;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          color: Colors.grey,
          child: Column(
            children: [
              Container(
                color: Colors.red,
                height: 450,
                width: double.infinity,
                child: FadeInImage.assetNetwork(
                    fit: BoxFit.contain,
                    placeholder: '',
                    image:
                        'https://firebasestorage.googleapis.com/v0/b/jista-81374.appspot.com/o/hizmet_giyecegi%2Fhizmet_kiyafeti.png?alt=media&token=b234e67b-c15e-4354-a435-04ecee31a7db'),
              ),
              Text(product.type),
              Text(product.title),
              SizedBox(
                height: 60,
                width: 250,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      color: Colors.orange,
                      child: Column(
                        children: [
                          Text('Kargo Durumu'),
                          Text(product.cargoStatus ? 'Evet' : 'Hayır'),
                        ],
                      ),
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      color: Colors.orange,
                      child: Column(
                        children: [
                          Text('Kargo Durumu'),
                          Text(product.cargoStatus ? 'Evet' : 'Hayır'),
                        ],
                      ),
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      color: Colors.orange,
                      child: Column(
                        children: [
                          Text('Kargo Durumu'),
                          Text(product.cargoStatus ? 'Evet' : 'Hayır'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
