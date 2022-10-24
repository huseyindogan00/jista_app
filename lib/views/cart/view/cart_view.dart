import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:jista/views/base/base_model.dart';
import 'package:jista/views/cart/view_model/cart_view_model.dart';

import '../../../product/models/cart/cart_model.dart';

class CartView extends StatelessWidget {
  CartView({super.key});
  final cartController = Get.put(CartViewModel());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: const Text('Sepet'),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          backgroundColor: Colors.cyan.shade800,
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: CartViewModel.cartListItem.length,
          itemBuilder: (context, index) {
            CartModel cartItem = CartViewModel.cartListItem[index];
            return Card(
              color: Colors.grey,
              child: Slidable(
                key: const ValueKey<int>(0),
                startActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  dismissible: DismissiblePane(
                    onDismissed: () {
                      ///************************************************************************
                      print(CartViewModel.cartListItem.length);
                      CartViewModel.cartListItem.remove(cartItem);
                      Get.put(BaseModel()).cartTotal.value =
                          CartViewModel.cartListItem.length;
                      print(CartViewModel.cartListItem.length);

                      ///************************************************************************
                    },
                  ),
                  children: [
                    SlidableAction(
                      icon: Icons.delete,
                      label: 'Sil',
                      autoClose: false,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      flex: 1,
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.red,
                      spacing: 5,
                      //padding: EdgeInsets.all(8),
                      onPressed: (context) {
                        print(CartViewModel.cartListItem.length);
                        CartViewModel.cartListItem.remove(cartItem);
                        Get.put(BaseModel()).cartTotal.value =
                            CartViewModel.cartListItem.length;
                        print(CartViewModel.cartListItem.length);
                      },
                    ),
                    SlidableAction(
                      icon: Icons.edit,
                      label: 'Düzenle',
                      onPressed: (context) {
                        DoNothingAction();
                      },
                    )
                  ],
                ),
                child: ListTile(
                  leading: Text(cartItem.productModel.gender),
                  title: Text(cartItem.productModel.type),
                  subtitle: Text(cartItem.productModel.title),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
