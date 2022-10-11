import 'package:get/get.dart';
import 'package:jista/views/cargo/view/cargo_info_view.dart';
import 'package:jista/views/cargo/view_model/cargo_info_view_model.dart';
import 'package:jista/views/products/view/product_details_view.dart';
import 'package:jista/views/products/view_model/product_view_model.dart';
import 'package:jista/views/category_module/service_page/view/service_wear_view.dart';
import 'package:jista/views/category_module/service_page/view_model/service_wear_view_model.dart';
import 'package:jista/views/home/view_model/home_view_model.dart';
import 'package:jista/views/period/view/ration_request_period_view.dart';

import '../../product/error/error_view.dart';
import '../../views/entry/view/entry_view.dart';
import '../../views/home/view/home_view.dart';
import '../../views/register/view/register_view.dart';
import '../../views/splash/view/splash_view.dart';

class RouteName {
  // starting app
  static const String entryView = '/entryView';
  static const String registerView = '/registerView';
  static const String splashView = '/splashView';

  // bottomnavigator pages
  static const String homeView = '/homeView';
  static const String cargoInfoView = '/cargoInfoView';
  static const String requestPeriodView = '/requestPeriodView';
  static const String sizeInfoView = '/sizeInfoView';

  //category pages
  static const String serviceWearView = '/serviceWearView';
  static const String trainingClothing = '/trainingClothing';
  static const String staffTaskClothing = '/staffTaskClothing';

  //
  static const String cartView = '/cartView';
  static const String cartDetailsView = '/cartDetailsView';

  static const String errorView = '/errorView';
}

class RoutePage {
  static Transition _getTransition() {
    return GetPlatform.isAndroid ? Transition.native : Transition.cupertino;
  }

  static final List<GetPage> pageList = <GetPage>[
    GetPage(
      name: RouteName.splashView,
      page: () => const SplashView(),
      transition: _getTransition(),
    ),
    GetPage(
      name: RouteName.registerView,
      page: () => RegisterView(),
      transition: _getTransition(),
    ),
    GetPage(
      name: RouteName.entryView,
      page: () => EntryView(),
      transition: _getTransition(),
    ),
    GetPage(
      name: RouteName.homeView,
      page: () => HomeView(),
      transition: _getTransition(),
      binding: BindingsBuilder(
        () => Get.lazyPut<HomeViewModel>(() => HomeViewModel()),
      ),
    ),
    GetPage(
      name: RouteName.serviceWearView,
      page: () => ServiceWearView(),
      transition: null,
      binding: BindingsBuilder(
        () => Get.lazyPut<ServiceWearViewModel>(() => ServiceWearViewModel()),
      ),
    ),
    /* GetPage(
      name: RouteName.cartView,
      page: () => ProductView(),
      transition: _getTransition(),
      binding: BindingsBuilder(
        () => Get.lazyPut<ProductViewModel>(() => ProductViewModel()),
      ),
    ), */
    /*  GetPage(
      name: RouteName.cartDetailsView,
      page: () => ProductDetailView(productModel: null,),
      transition: _getTransition(),
      binding: BindingsBuilder(
        () => Get.lazyPut<ProductViewModel>(() => ProductViewModel()),
      ),
    ), */
    GetPage(
        name: RouteName.cargoInfoView,
        page: () => CargoInfoView(),
        binding: BindingsBuilder(
          () => Get.lazyPut<CargoInfoViewModel>(() => CargoInfoViewModel()),
        )),
    GetPage(
      name: RouteName.requestPeriodView,
      page: () => const RationRequestPeriodView(),
      transition: _getTransition(),
    ),
    GetPage(
      name: RouteName.errorView,
      page: () => ErrorView(errorTitle: ''),
      transition: _getTransition(),
    ),
  ];
}
