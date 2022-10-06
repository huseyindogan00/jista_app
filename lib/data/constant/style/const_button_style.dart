import 'package:flutter/material.dart';

class ConstButtonStyle {
  /* static ButtonStyle entryPageButtonStyle(BuildContext context) {
    return ElevatedButton.styleFrom(
      backgroundColor: Theme.of(context).primaryColor,
    );
  } */
  static ButtonStyle commonButtonStyle(BuildContext context) {
    return ElevatedButton.styleFrom(
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
