// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:jista/core/enums/view_state.dart';
import 'package:jista/core/services/service/firebase_store_service.dart';
import 'package:jista/core/services/service/hive_service.dart';
import 'package:jista/core/services/service_result/firebase_service_result_model.dart';
import 'package:jista/main.dart';
import 'package:jista/product/models/order/order_model.dart';
import 'package:jista/product/models/person/person_model.dart';
import 'package:jista/views/base/base_model.dart';

import '../../../product/models/cart/cart_model.dart';

class CartViewModel extends BaseModel {
  static List<CartModel> cartListItem = <CartModel>[];
  static int _cartTotalPoint = 0;
  var baseController = Get.put(BaseModel());
  var isCargoInfoAccept = false.obs;
  var firebaseService = FirebaseStoreService();

  var warning = ''.obs;

  addToCart(CartModel cartModel) {
    cartListItem.add(cartModel);
    _addCartTotalPoint();
  }

  removeToCart(int index) {
    cartListItem.removeAt(index);
    _addCartTotalPoint();
  }

  _addCartTotalPoint() {
    _cartTotalPoint = 0;
    for (CartModel cart in cartListItem) {
      _cartTotalPoint += (cart.productModel.point * cart.count);
    }
    baseController.cartTotalPoint.value = _cartTotalPoint;
  }

  Future<void> addOrder(BuildContext context, PersonModel personModel, int remainingPoints) async {
    baseController.setViewState(ViewState.BUSY);
    var _cartList = CartViewModel.cartListItem; //SEPETTE ÜRÜN VAR MI
    String resultMessage = '';
    List<OrderModel> _orderModelList = [];
    List<CartModel> _receivedProduct = [];

    if (_cartList.isNotEmpty) {
      if (remainingPoints >= 0) {
        for (var i = 0; i < _cartList.length; i++) {
          // ÜRÜN DAHA ÖNCE SİPARİŞ VERİLMİŞ Mİ
          FirebaseServiceResultModel isThereProduct =
              await firebaseService.isThereProduct(personModel.id, _cartList[i].productModel.id);

          if (isThereProduct.isSuccess) {
            _receivedProduct.add(_cartList[i]);
          } else {
            OrderModel order = OrderModel(
              productId: _cartList[i].productModel.id,
              size: _cartList[i].size,
              cargo: _cartList[i].sendByCargo,
              count: _cartList[i].count,
              dateTime: Timestamp.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch),
            );
            _orderModelList.add(order);
          }
        }

        if (_receivedProduct.isNotEmpty) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                actions: [
                  TextButton(
                      onPressed: () => context.router.pop(),
                      child: const Text(
                        'Anladım',
                        style: TextStyle(fontSize: 17, color: Colors.red),
                      ))
                ],
                title: const Text('Aşağıdaki ürünler daha önce sipariş verilmiştir.'),
                content: Column(
                  children: [
                    for (var item in _receivedProduct)
                      Container(
                        decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300)),
                        margin: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 50,
                              width: 50,
                              child: Image(
                                image: NetworkImage(item.productModel.imageUrl!),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Expanded(
                                child: Text(
                              item.productModel.title,
                              overflow: TextOverflow.fade,
                            )),
                          ],
                        ),
                      ),
                  ],
                ),
              );
            },
          );
          context.router.pop();
          baseController.setViewState(ViewState.IDLE);
          return;
        }
        /* 
          -Siparişler ekleniyor
          -Personelin puanı güncelleniyor
          -Telefon hafızasındaki personel bilgileri güncelleniyor        
        */
        FirebaseServiceResultModel result = await firebaseService.addOrderModel(personModel, _orderModelList);
        personModel.totalPoint = remainingPoints;
        await firebaseService.updatePerson(personModel);
        locator<HiveService>().saveBoxPerson(personModel);
        resultMessage = result.dataInfo!;
      } else {
        resultMessage = 'Puanınız yetersiz';
      }
    } else {
      resultMessage = 'Sepete ürün ekleyiniz';
    }
    context.router.pop();
    _clearCart();
    baseController.setViewState(ViewState.IDLE);
    EasyLoading.showInfo(resultMessage, duration: const Duration(seconds: 2));
  }

  getOrders(String personId) {
    /* kullanıcının mevcut siparişleri getirilecek */
  }

//**********************************************************
  void _clearCart() {
    baseController.cartTotal.value = 0;
    baseController.cartTotalPoint.value = 0;
    cartListItem.clear();
  }
}
