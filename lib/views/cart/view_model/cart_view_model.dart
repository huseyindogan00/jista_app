import 'package:get/get.dart';
import 'package:jista/product/models/order/order_model.dart';
import 'package:jista/product/models/product/product_model.dart';
import 'package:jista/views/base/base_model.dart';

import '../../../product/models/cart/cart_model.dart';

class CartViewModel extends BaseModel {
  static List<CartModel> cartListItem = <CartModel>[];
  static int _cartTotalPoint = 0;

  addToCart(CartModel cartModel) {
    cartListItem.add(cartModel);
    _calculateCartTotalPoint();
  }

  _calculateCartTotalPoint() {
    for (CartModel cart in cartListItem) {
      _cartTotalPoint += cart.productModel.point;
    }
    totalPoint.value = _cartTotalPoint;
  }

  addOrder(String personId, OrderModel orderModel) {
    /* veritabanına ekleme işlemleri yapılacak */
  }

  getOrders(String personId) {
    /* kullanıcının mevcut siparişleri getirilecek */
  }
}
