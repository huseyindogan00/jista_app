import 'package:jista/views/base/base_model.dart';

import '../../../data/constant/appbar_text/appbar_title.dart';

class AppbarBaseTabsTitle {
  static setAppTitle(int index, BaseModel ctrl) {
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
