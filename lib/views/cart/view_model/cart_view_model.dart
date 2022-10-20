import 'package:get/get.dart';
import 'package:jista/product/models/order/order_model.dart';
import 'package:jista/product/models/product/product_model.dart';
import 'package:jista/views/base/base_model.dart';

import '../../../product/models/cart/cart_model.dart';

class CartViewModel extends BaseModel {
  addOrder(String personId, OrderModel orderModel) {
    /* veritabanına ekleme işlemleri yapılacak */
  }

  getOrders(String personId) {
    /* kullanıcının mevcut siparişleri getirilecek */
  }
}
