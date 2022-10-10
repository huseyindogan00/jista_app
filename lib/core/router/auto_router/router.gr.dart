// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i15;

import 'package:auto_route/auto_route.dart' as _i12;
import 'package:auto_route/empty_router_widgets.dart' as _i4;
import 'package:flutter/material.dart' as _i13;

import '../../../data/constant/pages/pages_list.dart' as _i16;
import '../../../product/models/person/person_model.dart' as _i17;
import '../../../product/models/product/product_model.dart' as _i14;
import '../../../views/base/base_view.dart' as _i3;
import '../../../views/cargo/view/cargo_info_view.dart' as _i5;
import '../../../views/category_module/service_page/view/service_wear_view.dart'
    as _i9;
import '../../../views/category_module/staff_page/view/staff_task_clothing_view.dart'
    as _i11;
import '../../../views/category_module/training_page/view/training_clothing_view.dart'
    as _i10;
import '../../../views/entry/view/entry_view.dart' as _i2;
import '../../../views/home/view/home_view.dart' as _i8;
import '../../../views/period/view/ration_request_period_view.dart' as _i6;
import '../../../views/size/view/size_info.dart' as _i7;
import '../../../views/splash/view/splash_view.dart' as _i1;

class AutoRoute extends _i12.RootStackRouter {
  AutoRoute([_i13.GlobalKey<_i13.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    SplashRouter.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashView());
    },
    EntryRouter.name: (routeData) {
      final args = routeData.argsAs<EntryRouterArgs>(
          orElse: () => const EntryRouterArgs());
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.EntryView(key: args.key));
    },
    BaseRouter.name: (routeData) {
      final args = routeData.argsAs<BaseRouterArgs>();
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.BaseView<dynamic>(
              key: args.key,
              appTitle: args.appTitle,
              onBuilder: args.onBuilder,
              onBuilderProductModel: args.onBuilderProductModel,
              pagesList: args.pagesList,
              personModel: args.personModel));
    },
    RegisterView.name: (routeData) {
      final args = routeData.argsAs<RegisterViewArgs>(
          orElse: () => const RegisterViewArgs());
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.EntryView(key: args.key));
    },
    HomeRouter.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.EmptyRouterPage());
    },
    CargoInfoRouter.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.CargoInfoView());
    },
    RationRequestPeriodRouter.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.RationRequestPeriodView());
    },
    SizeInfoRouter.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.SizeInfoView());
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: _i8.HomeView(key: args.key));
    },
    ServiceWearRoute.name: (routeData) {
      final args = routeData.argsAs<ServiceWearRouteArgs>(
          orElse: () => const ServiceWearRouteArgs());
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i9.ServiceWearView(
              key: args.key, personModel: args.personModel));
    },
    TrainingClothingRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: _i10.TrainingClothingView());
    },
    StaffTaskClothingRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: _i11.StaffTaskClothingView());
    }
  };

  @override
  List<_i12.RouteConfig> get routes => [
        _i12.RouteConfig(SplashRouter.name, path: '/'),
        _i12.RouteConfig(EntryRouter.name, path: 'entryView', children: [
          _i12.RouteConfig(RegisterView.name,
              path: 'entryView/registerView', parent: EntryRouter.name)
        ]),
        _i12.RouteConfig(BaseRouter.name, path: 'baseView', children: [
          _i12.RouteConfig(HomeRouter.name,
              path: '',
              parent: BaseRouter.name,
              children: [
                _i12.RouteConfig(HomeRoute.name,
                    path: '', parent: HomeRouter.name),
                _i12.RouteConfig(ServiceWearRoute.name,
                    path: 'serviceWearView', parent: HomeRouter.name),
                _i12.RouteConfig(TrainingClothingRoute.name,
                    path: 'trainingClothing', parent: HomeRouter.name),
                _i12.RouteConfig(StaffTaskClothingRoute.name,
                    path: 'staffTaskClothing', parent: HomeRouter.name)
              ]),
          _i12.RouteConfig(CargoInfoRouter.name,
              path: 'cargoInfoView', parent: BaseRouter.name),
          _i12.RouteConfig(RationRequestPeriodRouter.name,
              path: 'rationRequestPeriodView', parent: BaseRouter.name),
          _i12.RouteConfig(SizeInfoRouter.name,
              path: 'sizeInfoView', parent: BaseRouter.name)
        ])
      ];
}

/// generated route for
/// [_i1.SplashView]
class SplashRouter extends _i12.PageRouteInfo<void> {
  const SplashRouter() : super(SplashRouter.name, path: '/');

  static const String name = 'SplashRouter';
}

/// generated route for
/// [_i2.EntryView]
class EntryRouter extends _i12.PageRouteInfo<EntryRouterArgs> {
  EntryRouter({_i13.Key? key, List<_i12.PageRouteInfo>? children})
      : super(EntryRouter.name,
            path: 'entryView',
            args: EntryRouterArgs(key: key),
            initialChildren: children);

  static const String name = 'EntryRouter';
}

class EntryRouterArgs {
  const EntryRouterArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'EntryRouterArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.BaseView<dynamic>]
class BaseRouter extends _i12.PageRouteInfo<BaseRouterArgs> {
  BaseRouter(
      {_i13.Key? key,
      required String appTitle,
      required _i13.Widget Function(
              _i13.BuildContext, T, List<_i14.ProductModel>?)
          onBuilder,
      _i15.Future<List<_i14.ProductModel>?> Function(T)? onBuilderProductModel,
      List<_i16.PagesList>? pagesList,
      _i17.PersonModel? personModel,
      List<_i12.PageRouteInfo>? children})
      : super(BaseRouter.name,
            path: 'baseView',
            args: BaseRouterArgs(
                key: key,
                appTitle: appTitle,
                onBuilder: onBuilder,
                onBuilderProductModel: onBuilderProductModel,
                pagesList: pagesList,
                personModel: personModel),
            initialChildren: children);

  static const String name = 'BaseRouter';
}

class BaseRouterArgs {
  const BaseRouterArgs(
      {this.key,
      required this.appTitle,
      required this.onBuilder,
      this.onBuilderProductModel,
      this.pagesList,
      this.personModel});

  final _i13.Key? key;

  final String appTitle;

  final _i13.Widget Function(_i13.BuildContext, T, List<_i14.ProductModel>?)
      onBuilder;

  final _i15.Future<List<_i14.ProductModel>?> Function(T)?
      onBuilderProductModel;

  final List<_i16.PagesList>? pagesList;

  final _i17.PersonModel? personModel;

  @override
  String toString() {
    return 'BaseRouterArgs{key: $key, appTitle: $appTitle, onBuilder: $onBuilder, onBuilderProductModel: $onBuilderProductModel, pagesList: $pagesList, personModel: $personModel}';
  }
}

/// generated route for
/// [_i2.EntryView]
class RegisterView extends _i12.PageRouteInfo<RegisterViewArgs> {
  RegisterView({_i13.Key? key})
      : super(RegisterView.name,
            path: 'entryView/registerView', args: RegisterViewArgs(key: key));

  static const String name = 'RegisterView';
}

class RegisterViewArgs {
  const RegisterViewArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'RegisterViewArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.EmptyRouterPage]
class HomeRouter extends _i12.PageRouteInfo<void> {
  const HomeRouter({List<_i12.PageRouteInfo>? children})
      : super(HomeRouter.name, path: '', initialChildren: children);

  static const String name = 'HomeRouter';
}

/// generated route for
/// [_i5.CargoInfoView]
class CargoInfoRouter extends _i12.PageRouteInfo<void> {
  const CargoInfoRouter() : super(CargoInfoRouter.name, path: 'cargoInfoView');

  static const String name = 'CargoInfoRouter';
}

/// generated route for
/// [_i6.RationRequestPeriodView]
class RationRequestPeriodRouter extends _i12.PageRouteInfo<void> {
  const RationRequestPeriodRouter()
      : super(RationRequestPeriodRouter.name, path: 'rationRequestPeriodView');

  static const String name = 'RationRequestPeriodRouter';
}

/// generated route for
/// [_i7.SizeInfoView]
class SizeInfoRouter extends _i12.PageRouteInfo<void> {
  const SizeInfoRouter() : super(SizeInfoRouter.name, path: 'sizeInfoView');

  static const String name = 'SizeInfoRouter';
}

/// generated route for
/// [_i8.HomeView]
class HomeRoute extends _i12.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({_i13.Key? key})
      : super(HomeRoute.name, path: '', args: HomeRouteArgs(key: key));

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i9.ServiceWearView]
class ServiceWearRoute extends _i12.PageRouteInfo<ServiceWearRouteArgs> {
  ServiceWearRoute({_i13.Key? key, _i17.PersonModel? personModel})
      : super(ServiceWearRoute.name,
            path: 'serviceWearView',
            args: ServiceWearRouteArgs(key: key, personModel: personModel));

  static const String name = 'ServiceWearRoute';
}

class ServiceWearRouteArgs {
  const ServiceWearRouteArgs({this.key, this.personModel});

  final _i13.Key? key;

  final _i17.PersonModel? personModel;

  @override
  String toString() {
    return 'ServiceWearRouteArgs{key: $key, personModel: $personModel}';
  }
}

/// generated route for
/// [_i10.TrainingClothingView]
class TrainingClothingRoute extends _i12.PageRouteInfo<void> {
  const TrainingClothingRoute()
      : super(TrainingClothingRoute.name, path: 'trainingClothing');

  static const String name = 'TrainingClothingRoute';
}

/// generated route for
/// [_i11.StaffTaskClothingView]
class StaffTaskClothingRoute extends _i12.PageRouteInfo<void> {
  const StaffTaskClothingRoute()
      : super(StaffTaskClothingRoute.name, path: 'staffTaskClothing');

  static const String name = 'StaffTaskClothingRoute';
}
