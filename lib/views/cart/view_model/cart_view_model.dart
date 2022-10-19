import 'package:get/get.dart';
import 'package:jista/product/models/product/product_model.dart';

import '../../../product/models/cart/cart_model.dart';

class CartViewModel extends GetxController {
  RxList<CartModel> cartItem = <CartModel>[
    CartModel(
        productModel: ProductModel(
            id: 2,
            type: 'asdadsa',
            title: 'asdasdas',
            rank: '1312',
            season: '1asdasd',
            gender: 'awads',
            cargoStatus: true,
            quantity: 2,
            point: 321))
  ].obs;
}
