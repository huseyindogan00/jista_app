import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:jista/views/base/base_tabs_view.dart';
import 'package:jista/views/cargo/view/cargo_info_view.dart';
import 'package:jista/views/cart/view/cart_view.dart';
import 'package:jista/views/order/view/order_view.dart';
import 'package:jista/views/product/view/products_view.dart';
import 'package:jista/views/entry/view/entry_view.dart';
import 'package:jista/views/home/view/home_view.dart';
import 'package:jista/views/period/view/ration_request_period_view.dart';
import 'package:jista/views/product/view/product_details_view.dart';
import 'package:jista/views/register/view/register_view.dart';
import 'package:jista/views/size/view/size_info.dart';
import 'package:jista/views/splash/view/splash_view.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(
      initial: true,
      name: 'SplashRouter',
      page: SplashView,
    ),
    AutoRoute(
      path: 'entryView',
      page: EntryView,
    ),
    AutoRoute(
      path: 'registery',
      page: RegisterView,
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
            AutoRoute(
              initial: true,
              page: HomeView,
            ),
            AutoRoute(
              path: ':productTypeName',
              page: ProductsView,
            ),
            AutoRoute(
              path: ':productModel',
              page: ProductDetailsView,
            ),
          ],
        ),
        AutoRoute(
          path: 'cargoInfoView',
          name: 'CargoInfoRouter',
          page: CargoInfoView,
        ),
        AutoRoute(
          path: 'orderView',
          name: 'OrderRouter',
          page: OrderView,
        ),
        AutoRoute(
          path: 'rationRequestPeriodView',
          name: 'RationRequestPeriodRouter',
          page: RationRequestPeriodView,
        ),

        /* AutoRoute(
          path: 'sizeInfoView',
          name: 'SizeInfoRouter',
          page: SizeInfoView,
        ), */
      ],
    ),
    AutoRoute(
      path: 'cart',
      page: CartView,
    ),
  ],
)
class $AutoRouter {}

     

/* AutoRoute(
          path: '',
          name: 'HomeRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: '',
              page: HomeView,
            ),
            AutoRoute(
              path: '',
              page: ServiceWearView,
            ),
            AutoRoute(
              path: ':productModel',
              page: ProductDetailView,
            ),
            AutoRoute(page: TrainingClothingView),
            AutoRoute(page: StaffTaskClothingView),
          ],
        ),


      
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
              path: '',
              page: ServiceWearView,
            ),
            AutoRoute(
              path: ':productModel',
              page: ProductDetailView,
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
    ) */
