import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:jista/views/cart/view_model/cart_view_model.dart';

import '../../../product/models/cart/cart_model.dart';

class CartView extends StatelessWidget {
  CartView({super.key});
  final cartController = Get.put(CartViewModel());

  @override
  Widget build(BuildContext context) {
    print(cartController.cartItem.value.length);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Sepet'),
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            centerTitle: true,
          ),
          body: BottomSheet(
            onClosing: () {},
            builder: (context) {
              return Container(
                width: double.infinity,
                height: 400,
                child: cartController.cartItem.value.isEmpty
                    ? Center(
                        child: Container(
                          child: Text('Sepetiniz boş'),
                        ),
                      )
                    : GetBuilder<CartViewModel>(
                        builder: (controller) => ListView.builder(
                          itemCount: controller.cartItem.value.length,
                          itemBuilder: (context, index) {
                            CartModel cartItem = controller.cartItem.value[index];
                            return Card(
                              child: ListTile(
                                leading: Text(cartItem.productModel.gender),
                                title: Text(cartItem.productModel.type),
                                subtitle: Text(cartItem.productModel.title),
                              ),
                            );
                          },
                        ),
                      ),
              );
            },
          )),
    );

/* cartController.cartItem.value.isEmpty
            ? Center(
                child: Container(
                  child: Text('Sepetiniz boş'),
                ),
              )
            : GetBuilder<CartViewModel>(
                builder: (controller) => ListView.builder(
                  itemCount: cartController.cartItem.value.length,
                  itemBuilder: (context, index) {
                    CartModel cartItem = cartController.cartItem.value[index];
                    return Card(
                      child: ListTile(
                        leading: Text(cartItem.productModel.gender),
                        title: Text(cartItem.productModel.type),
                        subtitle: Text(cartItem.productModel.title),
                      ),
                    );
                  },
                ),
              ), */
  }
}
