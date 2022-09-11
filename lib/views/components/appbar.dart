import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

AppBar appbar() {
  return AppBar(
    centerTitle: true,
    title: const Text(
      'Kategoriler',
      style: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w700),
    ),
    actions: [
      Badge(
        badgeColor: Colors.green,
        animationType: BadgeAnimationType.fade,
        position: const BadgePosition(start: 20, bottom: 25),
        alignment: const Alignment(0, 0.3),
        badgeContent: const Text('5'),
        child: InkWell(
          child: const Icon(Icons.add_shopping_cart_sharp, color: Colors.grey),
          onTap: () {
            print('Cart tıklandı');
          },
        ),
        /* child: (GestureDetector(
          child: const Icon(Icons.add_shopping_cart_sharp),
          onTap: () {
            // Cart iconuna tıklandığında carta ekleme yapar
          },
        )), */
      ),
      const SizedBox(width: 30),
    ],
  );
}
