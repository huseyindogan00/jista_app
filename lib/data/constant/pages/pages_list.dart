import 'package:auto_route/auto_route.dart';
import 'package:jista/core/router/auto_router/router.gr.dart';

import '../../../views/cargo/view/cargo_info_view.dart';
import '../../../views/category_module/service_page/view/service_wear_view.dart';
import '../../../views/category_module/staff_page/view/staff_task_clothing_view.dart';
import '../../../views/category_module/training_page/view/training_clothing_view.dart';
import '../../../views/home/view/home_view.dart';
import '../../../views/period/view/ration_request_period_view.dart';
import '../../../views/size/view/size_info.dart';

class PagesList {
  static List<PageRouteInfo> get pagesList {
    return <PageRouteInfo>[
      const HomeRouter(),
      CargoInfoRouter(),
      const SizeInfoRouter(),
      const RationRequestPeriodRouter()
    ];
  }
}
