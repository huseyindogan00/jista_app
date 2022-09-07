import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

AppBar appbar() {
  return AppBar(
    actions: [
      Badge(
        animationType: BadgeAnimationType.fade,
        badgeContent: const Text('5'),
        child: (GestureDetector(
          child: const Icon(Icons.add_shopping_cart_sharp),
          onTap: () {
            // Cart iconuna tıklandığında carta ekleme yapar
          },
        )),
      ),
      const SizedBox(width: 15)
    ],
  );
}
