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
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:auto_route/empty_router_widgets.dart' as _i5;
import 'package:flutter/material.dart' as _i15;

import '../../../views/base/base_tabs_view.dart' as _i4;
import '../../../views/cargo/view/cargo_info_view.dart' as _i6;
import '../../../views/category_module/service_page/view/service_wear_view.dart'
    as _i10;
import '../../../views/category_module/staff_page/view/staff_task_clothing_view.dart'
    as _i12;
import '../../../views/category_module/training_page/view/training_clothing_view.dart'
    as _i11;
import '../../../views/entry/view/entry_view.dart' as _i2;
import '../../../views/home/view/home_view.dart' as _i9;
import '../../../views/period/view/ration_request_period_view.dart' as _i7;
import '../../../views/products/view/product_details_view.dart' as _i13;
import '../../../views/register/view/register_view.dart' as _i3;
import '../../../views/size/view/size_info.dart' as _i8;
import '../../../views/splash/view/splash_view.dart' as _i1;

class AutoRouter extends _i14.RootStackRouter {
  AutoRouter([_i15.GlobalKey<_i15.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i14.PageFactory> pagesMap = {
    SplashRouter.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashView());
    },
    EntryRoute.name: (routeData) {
      final args = routeData.argsAs<EntryRouteArgs>(
          orElse: () => const EntryRouteArgs());
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.EntryView(key: args.key));
    },
    RegisterRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterRouteArgs>(
          orElse: () => const RegisterRouteArgs());
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.RegisterView(key: args.key));
    },
    BaseTabsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<BaseTabsRouteArgs>(
          orElse: () =>
              BaseTabsRouteArgs(personModel: pathParams.get('personModel')));
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i4.BaseTabsView(personModel: args.personModel, key: args.key));
    },
    HomeRouter.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.EmptyRouterPage());
    },
    CargoInfoRouter.name: (routeData) {
      final args = routeData.argsAs<CargoInfoRouterArgs>(
          orElse: () => const CargoInfoRouterArgs());
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: _i6.CargoInfoView(key: args.key));
    },
    RationRequestPeriodRouter.name: (routeData) {
      final args = routeData.argsAs<RationRequestPeriodRouterArgs>(
          orElse: () => const RationRequestPeriodRouterArgs());
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i7.RationRequestPeriodView(key: args.key));
    },
    SizeInfoRouter.name: (routeData) {
      final args = routeData.argsAs<SizeInfoRouterArgs>(
          orElse: () => const SizeInfoRouterArgs());
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: _i8.SizeInfoView(key: args.key));
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: _i9.HomeView(key: args.key));
    },
    ServiceWearRoute.name: (routeData) {
      final args = routeData.argsAs<ServiceWearRouteArgs>(
          orElse: () => const ServiceWearRouteArgs());
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: _i10.ServiceWearView(key: args.key));
    },
    TrainingClothingRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: _i11.TrainingClothingView());
    },
    StaffTaskClothingRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: _i12.StaffTaskClothingView());
    },
    ProductDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ProductDetailRouteArgs>(
          orElse: () => ProductDetailRouteArgs(
              productModel: pathParams.get('productModel')));
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i13.ProductDetailView(
              productModel: args.productModel, key: args.key));
    }
  };

  @override
  List<_i14.RouteConfig> get routes => [
        _i14.RouteConfig(SplashRouter.name, path: '/'),
        _i14.RouteConfig(EntryRoute.name, path: 'entryView'),
        _i14.RouteConfig(RegisterRoute.name, path: 'registery'),
        _i14.RouteConfig(BaseTabsRoute.name, path: '/:personModel', children: [
          _i14.RouteConfig(HomeRouter.name,
              path: '',
              parent: BaseTabsRoute.name,
              children: [
                _i14.RouteConfig(HomeRoute.name,
                    path: '', parent: HomeRouter.name),
                _i14.RouteConfig(ServiceWearRoute.name,
                    path: 'serviceWear', parent: HomeRouter.name),
                _i14.RouteConfig(TrainingClothingRoute.name,
                    path: 'trainingClothing', parent: HomeRouter.name),
                _i14.RouteConfig(StaffTaskClothingRoute.name,
                    path: 'staffTaskClothing', parent: HomeRouter.name),
                _i14.RouteConfig(ProductDetailRoute.name,
                    path: ':productModel', parent: HomeRouter.name)
              ]),
          _i14.RouteConfig(CargoInfoRouter.name,
              path: 'cargoInfoView', parent: BaseTabsRoute.name),
          _i14.RouteConfig(RationRequestPeriodRouter.name,
              path: 'rationRequestPeriodView', parent: BaseTabsRoute.name),
          _i14.RouteConfig(SizeInfoRouter.name,
              path: 'sizeInfoView', parent: BaseTabsRoute.name)
        ])
      ];
}

/// generated route for
/// [_i1.SplashView]
class SplashRouter extends _i14.PageRouteInfo<void> {
  const SplashRouter() : super(SplashRouter.name, path: '/');

  static const String name = 'SplashRouter';
}

/// generated route for
/// [_i2.EntryView]
class EntryRoute extends _i14.PageRouteInfo<EntryRouteArgs> {
  EntryRoute({_i15.Key? key})
      : super(EntryRoute.name,
            path: 'entryView', args: EntryRouteArgs(key: key));

  static const String name = 'EntryRoute';
}

class EntryRouteArgs {
  const EntryRouteArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'EntryRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.RegisterView]
class RegisterRoute extends _i14.PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({_i15.Key? key})
      : super(RegisterRoute.name,
            path: 'registery', args: RegisterRouteArgs(key: key));

  static const String name = 'RegisterRoute';
}

class RegisterRouteArgs {
  const RegisterRouteArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'RegisterRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.BaseTabsView]
class BaseTabsRoute extends _i14.PageRouteInfo<BaseTabsRouteArgs> {
  BaseTabsRoute(
      {required dynamic personModel,
      _i15.Key? key,
      List<_i14.PageRouteInfo>? children})
      : super(BaseTabsRoute.name,
            path: '/:personModel',
            args: BaseTabsRouteArgs(personModel: personModel, key: key),
            rawPathParams: {'personModel': personModel},
            initialChildren: children);

  static const String name = 'BaseTabsRoute';
}

class BaseTabsRouteArgs {
  const BaseTabsRouteArgs({required this.personModel, this.key});

  final dynamic personModel;

  final _i15.Key? key;

  @override
  String toString() {
    return 'BaseTabsRouteArgs{personModel: $personModel, key: $key}';
  }
}

/// generated route for
/// [_i5.EmptyRouterPage]
class HomeRouter extends _i14.PageRouteInfo<void> {
  const HomeRouter({List<_i14.PageRouteInfo>? children})
      : super(HomeRouter.name, path: '', initialChildren: children);

  static const String name = 'HomeRouter';
}

/// generated route for
/// [_i6.CargoInfoView]
class CargoInfoRouter extends _i14.PageRouteInfo<CargoInfoRouterArgs> {
  CargoInfoRouter({_i15.Key? key})
      : super(CargoInfoRouter.name,
            path: 'cargoInfoView', args: CargoInfoRouterArgs(key: key));

  static const String name = 'CargoInfoRouter';
}

class CargoInfoRouterArgs {
  const CargoInfoRouterArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'CargoInfoRouterArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.RationRequestPeriodView]
class RationRequestPeriodRouter
    extends _i14.PageRouteInfo<RationRequestPeriodRouterArgs> {
  RationRequestPeriodRouter({_i15.Key? key})
      : super(RationRequestPeriodRouter.name,
            path: 'rationRequestPeriodView',
            args: RationRequestPeriodRouterArgs(key: key));

  static const String name = 'RationRequestPeriodRouter';
}

class RationRequestPeriodRouterArgs {
  const RationRequestPeriodRouterArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'RationRequestPeriodRouterArgs{key: $key}';
  }
}

/// generated route for
/// [_i8.SizeInfoView]
class SizeInfoRouter extends _i14.PageRouteInfo<SizeInfoRouterArgs> {
  SizeInfoRouter({_i15.Key? key})
      : super(SizeInfoRouter.name,
            path: 'sizeInfoView', args: SizeInfoRouterArgs(key: key));

  static const String name = 'SizeInfoRouter';
}

class SizeInfoRouterArgs {
  const SizeInfoRouterArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'SizeInfoRouterArgs{key: $key}';
  }
}

/// generated route for
/// [_i9.HomeView]
class HomeRoute extends _i14.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({_i15.Key? key})
      : super(HomeRoute.name, path: '', args: HomeRouteArgs(key: key));

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i10.ServiceWearView]
class ServiceWearRoute extends _i14.PageRouteInfo<ServiceWearRouteArgs> {
  ServiceWearRoute({_i15.Key? key})
      : super(ServiceWearRoute.name,
            path: 'serviceWear', args: ServiceWearRouteArgs(key: key));

  static const String name = 'ServiceWearRoute';
}

class ServiceWearRouteArgs {
  const ServiceWearRouteArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'ServiceWearRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i11.TrainingClothingView]
class TrainingClothingRoute extends _i14.PageRouteInfo<void> {
  const TrainingClothingRoute()
      : super(TrainingClothingRoute.name, path: 'trainingClothing');

  static const String name = 'TrainingClothingRoute';
}

/// generated route for
/// [_i12.StaffTaskClothingView]
class StaffTaskClothingRoute extends _i14.PageRouteInfo<void> {
  const StaffTaskClothingRoute()
      : super(StaffTaskClothingRoute.name, path: 'staffTaskClothing');

  static const String name = 'StaffTaskClothingRoute';
}

/// generated route for
/// [_i13.ProductDetailView]
class ProductDetailRoute extends _i14.PageRouteInfo<ProductDetailRouteArgs> {
  ProductDetailRoute({required dynamic productModel, _i15.Key? key})
      : super(ProductDetailRoute.name,
            path: ':productModel',
            args: ProductDetailRouteArgs(productModel: productModel, key: key),
            rawPathParams: {'productModel': productModel});

  static const String name = 'ProductDetailRoute';
}

class ProductDetailRouteArgs {
  const ProductDetailRouteArgs({required this.productModel, this.key});

  final dynamic productModel;

  final _i15.Key? key;

  @override
  String toString() {
    return 'ProductDetailRouteArgs{productModel: $productModel, key: $key}';
  }
}
