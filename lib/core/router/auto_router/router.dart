import 'package:auto_route/annotations.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:jista/core/router/auto_router/router.gr.dart';
import 'package:jista/core/router/route_name.dart';
import 'package:jista/views/base/base_tabs_view.dart';
import 'package:jista/views/base/base_view.dart';
import 'package:jista/views/cargo/view/cargo_info_view.dart';
import 'package:jista/views/category_module/service_page/view/service_wear_view.dart';
import 'package:jista/views/category_module/staff_page/view/staff_task_clothing_view.dart';
import 'package:jista/views/category_module/training_page/view/training_clothing_view.dart';
import 'package:jista/views/entry/view/entry_view.dart';
import 'package:jista/views/home/view/home_view.dart';
import 'package:jista/views/period/view/ration_request_period_view.dart';
import 'package:jista/views/products/view/product_view.dart';
import 'package:jista/views/size/view/size_info.dart';
import 'package:jista/views/splash/view/splash_view.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: 'splashView',
      name: 'SplashRouter',
      page: SplashView,
    ),
    AutoRoute(
      path: 'entryView',
      page: EntryView,
    ),
    /* AutoRoute(
      path: 'registerView',
      name: 'RegisterView',
      page: RegisterView,
    ), */
    AutoRoute(
      path: '/',
      page: BaseTabsView,
      children: [
        AutoRoute(
          path: '',
          name: 'HomeRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: '',
              page: HomeView,
            ),
            AutoRoute(
              path: 'serviceWearView',
              name: 'ServiceWearRoute',
              page: ServiceWearView,
              children: [
                AutoRoute(
                  path: 'productView',
                  page: ProductView,
                ),
              ],
            ),
            AutoRoute(
              path: 'trainingClothing',
              page: TrainingClothingView,
            ),
            AutoRoute(
              path: 'staffTaskClothing',
              page: StaffTaskClothingView,
            ),
          ],
        ),
        AutoRoute(
          path: 'cargoInfoView',
          name: 'CargoInfoRouter',
          page: CargoInfoView,
        ),
        AutoRoute(
          path: 'rationRequestPeriodView',
          name: 'RationRequestPeriodRouter',
          page: RationRequestPeriodView,
        ),
        AutoRoute(
          path: 'sizeInfoView',
          name: 'SizeInfoRouter',
          page: SizeInfoView,
        ),
      ],
    ),
  ],
)
class $AutoRouter {}