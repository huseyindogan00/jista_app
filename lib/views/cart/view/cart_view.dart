// ignore_for_file: unused_field, no_leading_underscores_for_local_identifiers

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:jista/core/enums/view_state.dart';
import 'package:jista/core/router/auto_router/router.gr.dart';
import 'package:jista/core/services/service/hive_service.dart';
import 'package:jista/product/models/person/person_model.dart';
import 'package:jista/views/base/base_model.dart';
import 'package:jista/views/cart/view_model/cart_view_model.dart';

import '../../../product/models/cart/cart_model.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  //final _cartController = Get.put(CartViewModel());

  final _baseController = Get.put<BaseModel>(BaseModel());
  final _cargoViewController = Get.put<CartViewModel>(CartViewModel());

  bool checkboxCargo = false;
  final bool _isCargoInfoAccept = false;

  bool submit = false;

  PersonModel? _personModel;

  @override
  void initState() {
    super.initState();
    getPerson();
  }

  getPerson() async {
    _personModel = await HiveService().getBoxPerson('person');
  }

  @override
  Widget build(BuildContext context) {
    getPerson();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 234, 234),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.router.pop(),
        ),
        toolbarHeight: 75,
        title: Obx(
          () => Text(
            'Sepetim (${_baseController.cartTotal.value} Ürün)\nToplam ürün puanı : ${_baseController.cartTotalPoint}',
            textAlign: TextAlign.center,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: Color.fromARGB(255, 25, 72, 110),
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: _buildShowModalBottomSheet,
        elevation: 5,
        backgroundColor: const Color.fromARGB(255, 4, 80, 87),
        child: const Text(
          'Onay',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
        ),
      ),
      body: CartViewModel.cartListItem.isEmpty
          ? const Center(
              child: Text('Sepetinizde ürün bulunmamaktadır'),
            )
          : SlidableAutoCloseBehavior(
              closeWhenOpened: true,
              child: ListView.builder(
                itemCount: CartViewModel.cartListItem.length,
                itemBuilder: (context, index) {
                  CartModel cartItem = CartViewModel.cartListItem[index];
                  return _buildProductCard(index, context, cartItem);
                },
              ),
            ),
    );
  }

  Card _buildProductCard(int index, BuildContext context, CartModel cartItem) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(top: 15),
      color: Colors.white,
      child: Slidable(
        key: UniqueKey(),
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
              padding: const EdgeInsets.all(5),
              width: double.infinity,
              height: 220,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildProductImageAndIsCargo(context, cartItem),
                  _buildProductInfo(cartItem),
                  _buildProductCountSizePoint(cartItem)
                ],
              ),
            ),
            _buildStackCargoIcon(cartItem),
          ],
        ),
      ),
    );
  }

  Widget _buildStackCargoIcon(CartModel cartItem) {
    return cartItem.productModel.cargoStatus
        ? Positioned(
            left: 3,
            top: 0,
            child: Container(
              width: 20,
              height: 25,
              decoration: const BoxDecoration(
                boxShadow: [BoxShadow(blurRadius: 1)],
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(2), bottomLeft: Radius.circular(2)),
                color: Colors.amber,
              ),
              child: const Icon(
                Icons.local_shipping_outlined,
                size: 17,
                color: Color.fromARGB(255, 136, 9, 9),
              ),
            ),
          )
        : const SizedBox();
  }

  Expanded _buildProductCountSizePoint(CartModel cartItem) {
    return Expanded(
      flex: 7,
      child: Padding(
        padding: const EdgeInsets.only(left: 15, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Adet\t\t\t\t: ${cartItem.count}'),
            const SizedBox(height: 10),
            Text('Beden\t: ${cartItem.size}'),
            const SizedBox(height: 10),
            Text(
              'Puan : ${cartItem.productModel.point}',
              style: TextStyle(color: Colors.orange.shade800, fontSize: 20),
            )
          ],
        ),
      ),
    );
  }

  Expanded _buildProductInfo(CartModel cartItem) {
    return Expanded(
      flex: 9,
      child: Padding(
        padding: const EdgeInsets.only(left: 15, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cartItem.productModel.type,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
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
                  maxLines: 2,
                ),
                Text('Sezon : ${cartItem.productModel.season}'),
                Text(cartItem.productModel.cargoStatus ? 'Kargo : Var' : 'Kargo : Yok'),
                Text('Cinsiyet : ${cartItem.productModel.gender}'),
                Text('Rütbe : ${cartItem.productModel.rank}'),
              ],
            )
          ],
        ),
      ),
    );
  }

  Expanded _buildProductImageAndIsCargo(BuildContext context, CartModel cartItem) {
    return Expanded(
      flex: 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 80,
            padding: const EdgeInsets.all(3.0),
            child: InkWell(
              onTap: () => context.router.push(CartImageRouter(imageUrl: cartItem.productModel.imageUrl)),
              child: Image(image: NetworkImage(cartItem.productModel.imageUrl!), fit: BoxFit.contain),
            ),
          ),
          cartItem.productModel.cargoStatus
              ? Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    const Divider(),
                    Text(
                      'Kargo İle Gönder',
                      style: TextStyle(fontSize: 13, color: Colors.yellow.shade900),
                    ),
                    Checkbox(
                      value: cartItem.sendByCargo,
                      onChanged: (value) {
                        if (value!) {
                          cartItem.sendByCargo = value;
                        } else {
                          cartItem.sendByCargo = value;
                        }
                        setState(() {
                          cartItem.sendByCargo = value;
                        });
                      },
                    ),
                  ],
                )
              : const SizedBox(height: 50),
        ],
      ),
    );
  }

  _buildShowModalBottomSheet() {
    int _cartTotalPoint = _baseController.cartTotalPoint.value;
    int _personTotalPoint = _personModel?.totalPoint ?? 0;
    int _remainingPoints = (_personTotalPoint - _cartTotalPoint);

    TextStyle titleTextStyle = TextStyle(color: Colors.blue.shade800, fontSize: 18);
    TextStyle pointTextStyle = TextStyle(color: Colors.orange.shade900, fontSize: 19);

    _cargoViewController.isCargoInfoAccept.value = false;

    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      elevation: 20,
      isDismissible: true,
      context: context,
      builder: (context) {
        return Obx(
          () => _baseController.viewState == ViewState.BUSY
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.amber,
                ))
              : Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                    color: Color.fromARGB(255, 206, 212, 212),
                    boxShadow: [BoxShadow(blurRadius: 3)],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Divider(color: Colors.white38, height: 25, thickness: 5, indent: 140, endIndent: 140),
                        Container(
                          height: 300,
                          width: double.infinity,
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(10)),
                          child: Wrap(
                            runSpacing: 20,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Mecvut Puan', style: titleTextStyle),
                                  Text(_personTotalPoint.toString(), style: pointTextStyle),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Toplam Ürün Puanı', style: titleTextStyle),
                                  Text(_cartTotalPoint.toString(), style: pointTextStyle),
                                ],
                              ),
                              const Divider(height: 2),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Kalan Puan', style: titleTextStyle),
                                  Text(_remainingPoints.toString(), style: pointTextStyle),
                                ],
                              ),
                              _isSendByCargo()
                                  ? Obx(
                                      () => Column(
                                        children: [
                                          Row(
                                            children: [
                                              Checkbox(
                                                value: _cargoViewController.isCargoInfoAccept.value,
                                                onChanged: (value) {
                                                  _cargoViewController.isCargoInfoAccept.value = value!;
                                                  submit = value;
                                                },
                                              ),
                                              const Text('Kargo Bilgilerim güncel'),
                                            ],
                                          ),
                                          const SizedBox(height: 20),
                                          Column(
                                            children: [
                                              SizedBox(
                                                width: double.infinity,
                                                height: 40,
                                                child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                      backgroundColor: const Color.fromARGB(255, 36, 158, 124)),
                                                  onPressed:
                                                      submit ? () => _buildConfirmCartButton(_remainingPoints) : null,
                                                  child: const Text(
                                                    'Sepeti Onayla',
                                                    style: TextStyle(
                                                        color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  : Column(
                                      children: [
                                        const SizedBox(height: 30),
                                        SizedBox(
                                          width: double.infinity,
                                          height: 40,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: const Color.fromARGB(255, 36, 158, 124)),
                                            onPressed: () => _buildConfirmCartButton(_remainingPoints),
                                            child: const Text(
                                              'Sepeti Onayla',
                                              style: TextStyle(
                                                  color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Wrap(
                            runSpacing: 10,
                            children: [
                              Text(
                                '* \'Kargo İle Gönder\' seçeneği işaretlenen ürünler anlaşmalı kargo firmasıyla gönderilecektir.',
                                style: TextStyle(color: Colors.red.shade700, fontStyle: FontStyle.italic),
                              ),
                              Text(
                                '* Kargo adresiniz güncel değilse herhangi bir aksaklık yaşamamak için lütfen güncelleyiniz.',
                                style: TextStyle(color: Colors.red.shade700, fontStyle: FontStyle.italic),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }

  _buildConfirmCartButton(int remainingPoints) async {
    await _cargoViewController.addOrder(context, _personModel!, remainingPoints);
    setState(() {});
  }

  bool _isSendByCargo() {
    for (var i = 0; i < CartViewModel.cartListItem.length; i++) {
      bool res = CartViewModel.cartListItem[i].sendByCargo;
      if (res) return true;
    }
    return false;
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
