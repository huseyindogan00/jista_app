import 'package:get/get.dart';
import 'package:jista/product/models/order/order_model.dart';
import 'package:jista/product/models/product/product_model.dart';
import 'package:jista/views/base/base_model.dart';

import '../../../product/models/cart/cart_model.dart';

class CartViewModel extends BaseModel {
  static List<CartModel> cartListItem = <CartModel>[];
  static int _cartTotalPoint = 0;
  var baseController = Get.put(BaseModel());

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
    baseController.totalPoint.value = _cartTotalPoint;
  }

  addOrder(String personId, OrderModel orderModel) {
    /* veritabanına ekleme işlemleri yapılacak */
  }

  getOrders(String personId) {
    /* kullanıcının mevcut siparişleri getirilecek */
  }
}
