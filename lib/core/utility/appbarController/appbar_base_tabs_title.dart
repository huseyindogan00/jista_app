import 'package:get/get.dart';
import 'package:jista/views/base/base_model.dart';

import '../../../data/constant/appbar_text/appbar_title.dart';

class AppbarBaseTabsTitle {
  static final _ctrl = Get.find<BaseModel>();
  static setAppTitleWithIndex(int index) {
    switch (index) {
      case 0:
        _ctrl.appbarTitle.value = AppbarTitle.homePageTitle;
        break;
      case 1:
        _ctrl.appbarTitle.value = AppbarTitle.cargoPageTitle;
        break;
      case 2:
        _ctrl.appbarTitle.value = AppbarTitle.sizeInfoPageTitle;
        break;
      case 3:
        _ctrl.appbarTitle.value = AppbarTitle.periodPageTitle;
        break;
      default:
    }
  }

  static setAppTitleWithString(String title) {
    _ctrl.appbarTitle.value = title;
  }
}
