import 'package:flutter/material.dart';
import 'package:jista/core/router/route_name.dart';
import 'package:jista/views/entry/view/entry_view.dart';
import 'package:jista/product/error/error_view.dart';
import 'package:jista/views/home/view/home_view.dart';
import 'package:jista/views/main/view/main_view.dart';
import 'package:jista/views/register/view/register_view.dart';
import '../../views/splash/view/splash_view.dart';

/* class RouteGenerator {
  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splashView:
        return _createRoute(const SplashView());
      case RouteName.mainView:
        return _createRoute(const MainView());
      case RouteName.homeView:
        return _createRoute(const HomeView());
      case RouteName.entryView:
        return _createRoute(EntryView());
      case RouteName.registerView:
        return _createRoute(RegisterView());
      default:
        return _createRoute(ErrorView(errorTitle: 'Hata oluştu'));
    }
  }

  static _createRoute(Widget pageWidget) {
    return MaterialPageRoute(builder: (context) => pageWidget);
  }
} */
