import 'package:auto_route/annotations.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:jista/views/base/base_tabs_view.dart';
import 'package:jista/views/cargo/view/cargo_info_view.dart';
import 'package:jista/views/category_module/service_page/view/service_wear_view.dart';
import 'package:jista/views/category_module/staff_page/view/staff_task_clothing_view.dart';
import 'package:jista/views/category_module/training_page/view/training_clothing_view.dart';
import 'package:jista/views/entry/view/entry_view.dart';
import 'package:jista/views/home/view/home_view.dart';
import 'package:jista/views/period/view/ration_request_period_view.dart';
import 'package:jista/views/products/view/product_details_view.dart';
import 'package:jista/views/size/view/size_info.dart';
import 'package:jista/views/splash/view/splash_view.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      name: 'SplashRouter',
      page: SplashView,
    ),
    AutoRoute(
      path: 'entryView',
      page: EntryView,
    ),
    AutoRoute(
      path: '/:personModel',
      page: BaseTabsView,
      children: [
        AutoRoute(
          path: '',
          name: 'HomeRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: 'home', page: HomeView),
            AutoRoute(
              name: 'ServiceWearRouter',
              page: EmptyRouterPage,
              children: [
                AutoRoute(path: '', page: ServiceWearView),
                AutoRoute(path: ':productModel', page: ProductDetailView),
              ],
            ),
            AutoRoute(page: TrainingClothingView),
            AutoRoute(page: StaffTaskClothingView),
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


/* AutoRoute(
      path: '/',
      page: HomePage,
      children: [
        AutoRoute(
          path: 'posts',
          name: 'PostsRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: PostsPage),
            AutoRoute(path: ':postId', page: SinglePostPage),
          ],
        ),
        AutoRoute(
          path: 'users',
          name: 'UsersRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: UsersPage),
            AutoRoute(path: ':userId', page: UserProfilePage),
          ],
        ),
        AutoRoute(
          path: 'settings',
          name: 'SettingsRouter',
          page: SettingsPage,
        )
      ],
    ) */