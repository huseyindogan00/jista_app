import 'package:flutter/cupertino.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: const Text('Hata Oluştu'),
      ),
    );
  }
}
