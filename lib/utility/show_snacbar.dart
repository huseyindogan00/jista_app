import 'package:flutter/material.dart';

class ShowSnacbar {
  static void showInfoWithSnacbar(BuildContext context, String info) {
    SnackBar snackBar = SnackBar(content: Text(info));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
