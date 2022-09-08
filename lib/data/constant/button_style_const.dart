import 'package:flutter/material.dart';

class ButtonStyleConst {
  static ButtonStyle entryPageButtonStyle(BuildContext context) {
    return ElevatedButton.styleFrom(
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
