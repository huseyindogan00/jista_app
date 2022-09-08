import 'package:flutter/material.dart';

class ShowDialog {
  static showInfoWithDialog(BuildContext context, String info) {
    AlertDialog alertDialog = AlertDialog(
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Tamam'))
      ],
      title: const Text('Bilgi!'),
      content: Text(info),
    );

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return alertDialog;
      },
    );
  }
}
