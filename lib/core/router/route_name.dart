import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:jista/views/category_module/service_page/view/service_wear_view.dart';
import 'package:jista/views/main/binding/main_binding.dart';
import 'package:jista/views/main/view/main_view.dart';
import 'package:jista/views/period/view/ration_request_period_view.dart';

import '../../product/error/error_view.dart';
import '../../views/entry/view/entry_view.dart';
import '../../views/home/view/home_view.dart';
import '../../views/register/view/register_view.dart';
import '../../views/splash/view/splash_view.dart';

class RouteName {
  static const String entryView = '/entryView';
  static const String registerView = '/registerView';
  static const String splashView = '/splashView';

  //
  static const String mainView = '/mainView';
  static const String homeView = '/homeView';
  static const String requestPeriodView = '/requestPeriodView';
  //category
  static const String serviceWearView = '/serviceWearView';
  static const String trainingClothing = '/trainingClothing';
  static const String staffTaskClothing = '/staffTaskClothing';

  static const String errorView = '/errorView';
}

class RoutePage {
  static Transition _getTransition() {
    return GetPlatform.isAndroid ? Transition.native : Transition.zoom;
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
      name: RouteName.mainView,
      page: () => MainView(),
      transition: _getTransition(),
      binding: MainBinding(),
    ),
    GetPage(
      name: RouteName.homeView,
      page: () => HomeView(),
      transition: _getTransition(),
    ),
    GetPage(
      name: RouteName.serviceWearView,
      page: () => ServiceWearView(),
      transition: _getTransition(),
    ),
    GetPage(
      name: RouteName.requestPeriodView,
      page: () => const RationRequestPeriodView(),
      transition: _getTransition(),
    ),
    GetPage(
      name: RouteName.errorView,
      page: () => ErrorView(
        errorTitle: '',
      ),
      transition: _getTransition(),
    ),
  ];
}
