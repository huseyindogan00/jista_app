import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
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
        toolbarHeight: 75,
        title: Obx(() => Text('Sepetim (${_baseController.cartTotal.value} Ürün)\nÜrün Toplam Puanı ${}')),
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: Colors.cyan.shade800,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(onPressed: _buildShowModalBottomSheet),
      body: SlidableAutoCloseBehavior(
        closeWhenOpened: true,
        child: ListView.builder(
          itemCount: CartViewModel.cartListItem.length,
          itemBuilder: (context, index) {
            CartModel cartItem = CartViewModel.cartListItem[index];
            return Card(
              elevation: 2,
              margin: const EdgeInsets.only(top: 15),
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
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Açıklama : ${cartItem.productModel.title}'),
                      Text('Sezon : ${cartItem.productModel.season}'),
                      Text(cartItem.productModel.cargoStatus ? 'Kargo : Evet' : 'Kargo : Hayır'),
                    ],
                  ),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Adet\t\t\t\t: ${cartItem.count}'),
                      Text('Beden\t: ${cartItem.size}'),
                      SizedBox(height: 5),
                      Text('Puan : ${cartItem.productModel.point}')
                    ],
                  ),
                  isThreeLine: true,
                ),
              ),
            );
          },
        ),
      ),

      ///**BOTTOM SHEET İLE ANİMATİON CONTROLLER YAPILACAK VE CONTROL EDİLEVCEK */
    );
  }

  _buildShowModalBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container();
      },
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
