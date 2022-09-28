import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BaseView<T extends BaseModel> extends StatefulWidget {
  const BaseView<T extends BaseModel>({super.key});

  @override
  State<BaseView<T extends BaseModel>> createState() => _BaseView<T extends BaseModel>State();
}

class _BaseView<T extends BaseModel>State extends State<BaseView<T extends BaseModel>> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}