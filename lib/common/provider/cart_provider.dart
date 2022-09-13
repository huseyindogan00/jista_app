import 'package:flutter/material.dart';
import 'package:jista/models/product/product_model.dart';

class CartProdvider extends ChangeNotifier {
  List<ProductModel> cartList = [];
  int cartTotal = 0;

  void add(ProductModel product) {
    cartList.add(product);
    cartTotal = cartList.length;
    notifyListeners();
  }

  void remove(ProductModel product) {
    if (cartList.contains(product)) {
      cartList.remove(product);
    }

    notifyListeners();
  }
}
