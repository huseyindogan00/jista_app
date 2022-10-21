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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sepet'),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: CartViewModel.cartListItem.length,
          itemBuilder: (context, index) {
            CartModel cartItem = CartViewModel.cartListItem[index];
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
  }
}
