import 'package:flutter_easyloading/flutter_easyloading.dart';

class ShowEasyLoading {
  ShowEasyLoading() {
    easyloadingConfig();
  }

  void easyloadingConfig() {
    EasyLoading.instance
      ..dismissOnTap = true
      ..indicatorType = EasyLoadingIndicatorType.circle
      ..maskType = EasyLoadingMaskType.black;
  }
}
