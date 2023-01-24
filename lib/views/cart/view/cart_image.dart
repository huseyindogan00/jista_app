// ignore_for_file: must_be_immutable

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

class CartImageView extends StatelessWidget {
  CartImageView({super.key, @PathParam() this.imageUrl});

  dynamic imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade800,
      ),
      body: Center(
        child: Image(
          fit: BoxFit.fitHeight,
          image: NetworkImage(imageUrl),
        ),
      ),
    );
  }
}
