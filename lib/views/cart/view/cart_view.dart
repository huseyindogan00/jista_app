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
  //final _cartController = Get.put(CartViewModel());

  final _baseController = Get.put(BaseModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 234, 234),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.router.pop(),
        ),
        toolbarHeight: 75,
        title: Obx(() =>
            Text('Sepetim (${_baseController.cartTotal.value} Ürün)\nToplam Puanı ${_baseController.totalPoint}')),
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: Colors.cyan.shade800,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _buildShowModalBottomSheet,
        elevation: 5,
        backgroundColor: Colors.blueGrey,
        child: const Text('Onay'),
      ),
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
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey.shade400,
                          strokeAlign: StrokeAlign.outside,
                        ),
                      ),
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      height: 200,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () =>
                                        context.router.push(CartImageRouter(imageUrl: cartItem.productModel.imageUrl)),
                                    child: Image(image: NetworkImage(cartItem.productModel.imageUrl!)),
                                  ),
                                ),
                                cartItem.productModel.cargoStatus
                                    ? Wrap(
                                        alignment: WrapAlignment.center,
                                        children: [
                                          const Divider(),
                                          const Text('Kargo İle Gönder'),
                                          Checkbox(
                                            value: true,
                                            onChanged: (value) {},
                                          )
                                        ],
                                      )
                                    : SizedBox(height: 50),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15, top: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cartItem.productModel.type,
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                                  ),
                                  const Divider(),
                                  Wrap(
                                    crossAxisAlignment: WrapCrossAlignment.start,
                                    spacing: double.infinity,
                                    runSpacing: 10,
                                    children: [
                                      Text(
                                        cartItem.productModel.title,
                                        style: TextStyle(color: Colors.grey.shade600),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                      ),
                                      Text('Sezon : ${cartItem.productModel.season}'),
                                      Text(cartItem.productModel.cargoStatus ? 'Kargo : Var' : 'Kargo : Yok'),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Adet\t\t\t\t: ${cartItem.count}'),
                                Text('Beden\t: ${cartItem.size}'),
                                const SizedBox(height: 2),
                                Text(
                                  'Puan : ${cartItem.productModel.point}',
                                  style: TextStyle(color: Colors.orange.shade800, fontSize: 18),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    cartItem.productModel.cargoStatus
                        ? Positioned(
                            left: 3,
                            top: 0,
                            child: Container(
                              width: 20,
                              height: 25,
                              decoration: const BoxDecoration(
                                boxShadow: [BoxShadow(blurRadius: 1)],
                                borderRadius:
                                    BorderRadius.only(bottomRight: Radius.circular(2), bottomLeft: Radius.circular(2)),
                                color: Colors.amber,
                              ),
                              child: const Icon(
                                Icons.local_shipping_outlined,
                                size: 17,
                                color: Color.fromARGB(255, 136, 9, 9),
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ],
                )

                /* ListTile(
                  tileColor: Colors.white,
                  contentPadding: const EdgeInsets.all(15),
                  minLeadingWidth: 50,
                  leading: InkWell(
                      onTap: () => context.router.push(CartImageRouter(imageUrl: cartItem.productModel.imageUrl)),
                      child: Image(image: NetworkImage(cartItem.productModel.imageUrl!))),
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
                      const SizedBox(height: 2),
                      Text(
                        'Puan : ${cartItem.productModel.point}',
                        style: TextStyle(color: Colors.orange.shade800, fontSize: 18),
                      )
                    ],
                  ),
                  isThreeLine: true,
                ) */
                ,
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
          CartViewModel().removeToCart(index);
          Get.put(BaseModel()).cartTotal.value = CartViewModel.cartListItem.length;
        });
        break;
      default:
    }
  }
}

enum Action { delete, none }
