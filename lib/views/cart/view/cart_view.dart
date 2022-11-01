import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:jista/core/router/auto_router/router.gr.dart';
import 'package:jista/views/base/base_model.dart';
import 'package:jista/views/cart/view_model/cart_view_model.dart';

import '../../../product/models/cart/cart_model.dart';

class CartView extends StatefulWidget {
  CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final _cartController = Get.put(CartViewModel());

  final _baseController = Get.put(BaseModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 234, 234),
      appBar: AppBar(
        title: Obx(() => Text('Sepetim (${_baseController.cartTotal.value} Ürün)')),
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: Colors.cyan.shade800,
        centerTitle: true,
      ),
      body: SlidableAutoCloseBehavior(
        closeWhenOpened: true,
        child: ListView.builder(
          itemCount: CartViewModel.cartListItem.length,
          itemBuilder: (context, index) {
            CartModel cartItem = CartViewModel.cartListItem[index];
            return Card(
              elevation: 2,
              margin: EdgeInsets.only(top: 15),
              color: Colors.white,
              child: Slidable(
                key: Key(index.toString()),
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  dismissible: DismissiblePane(
                    onDismissed: () => _onDismissed(index, Action.delete),
                  ),
                  children: [
                    SlidableAction(
                      icon: Icons.delete,
                      label: 'Sil',
                      borderRadius: const BorderRadius.all(Radius.circular(0)),
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red,
                      spacing: 5,
                      onPressed: (context) => _onDismissed(index, Action.delete),
                    ),
                  ],
                ),
                child: ListTile(
                  tileColor: Colors.white,
                  contentPadding: const EdgeInsets.all(15),
                  minLeadingWidth: 50,
                  leading: Image(image: NetworkImage(cartItem.productModel.imageUrl!)),
                  title: Text(cartItem.productModel.type),
                  subtitle: Text(cartItem.productModel.title),
                  trailing: Text('${cartItem.count} Adet\nBeden:${cartItem.size}'),
                ),
              ),
            );
          },
        ),
      ),

      ///**BOTTOM SHEET İLE ANİMATİON CONTROLLER YAPILACAK VE CONTROL EDİLEVCEK */
      /* bottomSheet: BottomSheet(
        onClosing: () {},
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(100), topRight: Radius.circular(50))),
            height: 200,
            width: double.infinity,
          );
        },
      ) ,*/
    );
  }

  void _onDismissed(int index, Action action) {
    switch (action) {
      case Action.delete:
        setState(() {
          CartViewModel.cartListItem.removeAt(index);
          Get.put(BaseModel()).cartTotal.value = CartViewModel.cartListItem.length;
        });
        break;
      default:
    }
  }
}

enum Action { delete, none }
