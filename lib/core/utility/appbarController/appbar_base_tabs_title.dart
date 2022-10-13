import 'package:get/get.dart';
import 'package:jista/views/base/base_model.dart';

import '../../../data/constant/appbar_text/appbar_title.dart';

class AppbarBaseTabsTitle {
  static final ctrl = Get.find<BaseModel>();
  static setAppTitle(int index) {
    switch (index) {
      case 0:
        ctrl.appbarTitle.value = AppbarTitle.homePageTitle;
        break;
      case 1:
        ctrl.appbarTitle.value = AppbarTitle.cargoPageTitle;
        break;
      case 2:
        ctrl.appbarTitle.value = AppbarTitle.sizeInfoPageTitle;
        break;
      case 3:
        ctrl.appbarTitle.value = AppbarTitle.periodPageTitle;
        break;
      default:
    }
  }
}
