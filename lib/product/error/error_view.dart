// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';

class ErrorView extends StatelessWidget {
  String? errorTitle = '';
  ErrorView({Key? key, this.errorTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Hata Oluştu'),
    );
  }
}
