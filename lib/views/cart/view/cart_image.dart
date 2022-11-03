import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CartImageView extends StatelessWidget {
  CartImageView({super.key, @PathParam() this.imageUrl});

  dynamic imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade800,
      ),
      body: Image(
        fit: BoxFit.fitHeight,
        image: NetworkImage(imageUrl),
      ),
    );
  }
}
