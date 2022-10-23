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
import 'package:auto_route/empty_router_widgets.dart' as _i6;
import 'package:flutter/material.dart' as _i15;

import '../../../views/base/base_tabs_view.dart' as _i4;
import '../../../views/cargo/view/cargo_edit_view.dart' as _i13;
import '../../../views/cargo/view/cargo_info_view.dart' as _i12;
import '../../../views/cart/view/cart_view.dart' as _i5;
import '../../../views/entry/view/entry_view.dart' as _i2;
import '../../../views/home/view/home_view.dart' as _i9;
import '../../../views/order/view/order_view.dart' as _i7;
import '../../../views/period/view/ration_request_period_view.dart' as _i8;
import '../../../views/product/view/product_details_view.dart' as _i11;
import '../../../views/product/view/products_view.dart' as _i10;
import '../../../views/register/view/register_view.dart' as _i3;
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
    CartRoute.name: (routeData) {
      final args =
          routeData.argsAs<CartRouteArgs>(orElse: () => const CartRouteArgs());
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: _i5.CartView(key: args.key));
    },
    HomeRouter.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.EmptyRouterPage());
    },
    CargoInfoRouter.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.EmptyRouterPage());
    },
    OrderRouter.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.OrderView());
    },
    RationRequestPeriodRouter.name: (routeData) {
      final args = routeData.argsAs<RationRequestPeriodRouterArgs>(
          orElse: () => const RationRequestPeriodRouterArgs());
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i8.RationRequestPeriodView(key: args.key));
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: _i9.HomeView(key: args.key));
    },
    ProductsRoute.name: (routeData) {
      final args = routeData.argsAs<ProductsRouteArgs>();
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i10.ProductsView(
              key: args.key, productTypeName: args.productTypeName));
    },
    ProductDetailsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ProductDetailsRouteArgs>(
          orElse: () => ProductDetailsRouteArgs(
              productModel: pathParams.get('productModel')));
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i11.ProductDetailsView(
              productModel: args.productModel, key: args.key));
    },
    CargoInfoRoute.name: (routeData) {
      final args = routeData.argsAs<CargoInfoRouteArgs>(
          orElse: () => const CargoInfoRouteArgs());
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: _i12.CargoInfoView(key: args.key));
    },
    CargoEditRouter.name: (routeData) {
      final args = routeData.argsAs<CargoEditRouterArgs>(
          orElse: () => const CargoEditRouterArgs());
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: _i13.CargoEditView(key: args.key));
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
                _i14.RouteConfig(ProductsRoute.name,
                    path: ':productTypeName', parent: HomeRouter.name),
                _i14.RouteConfig(ProductDetailsRoute.name,
                    path: ':productModel', parent: HomeRouter.name)
              ]),
          _i14.RouteConfig(CargoInfoRouter.name,
              path: '',
              parent: BaseTabsRoute.name,
              children: [
                _i14.RouteConfig(CargoInfoRoute.name,
                    path: '', parent: CargoInfoRouter.name),
                _i14.RouteConfig(CargoEditRouter.name,
                    path: 'cargoEditView', parent: CargoInfoRouter.name)
              ]),
          _i14.RouteConfig(OrderRouter.name,
              path: 'orderView', parent: BaseTabsRoute.name),
          _i14.RouteConfig(RationRequestPeriodRouter.name,
              path: 'rationRequestPeriodView', parent: BaseTabsRoute.name)
        ]),
        _i14.RouteConfig(CartRoute.name, path: 'cart')
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
/// [_i5.CartView]
class CartRoute extends _i14.PageRouteInfo<CartRouteArgs> {
  CartRoute({_i15.Key? key})
      : super(CartRoute.name, path: 'cart', args: CartRouteArgs(key: key));

  static const String name = 'CartRoute';
}

class CartRouteArgs {
  const CartRouteArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'CartRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.EmptyRouterPage]
class HomeRouter extends _i14.PageRouteInfo<void> {
  const HomeRouter({List<_i14.PageRouteInfo>? children})
      : super(HomeRouter.name, path: '', initialChildren: children);

  static const String name = 'HomeRouter';
}

/// generated route for
/// [_i6.EmptyRouterPage]
class CargoInfoRouter extends _i14.PageRouteInfo<void> {
  const CargoInfoRouter({List<_i14.PageRouteInfo>? children})
      : super(CargoInfoRouter.name, path: '', initialChildren: children);

  static const String name = 'CargoInfoRouter';
}

/// generated route for
/// [_i7.OrderView]
class OrderRouter extends _i14.PageRouteInfo<void> {
  const OrderRouter() : super(OrderRouter.name, path: 'orderView');

  static const String name = 'OrderRouter';
}

/// generated route for
/// [_i8.RationRequestPeriodView]
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
/// [_i10.ProductsView]
class ProductsRoute extends _i14.PageRouteInfo<ProductsRouteArgs> {
  ProductsRoute({_i15.Key? key, required String productTypeName})
      : super(ProductsRoute.name,
            path: ':productTypeName',
            args:
                ProductsRouteArgs(key: key, productTypeName: productTypeName));

  static const String name = 'ProductsRoute';
}

class ProductsRouteArgs {
  const ProductsRouteArgs({this.key, required this.productTypeName});

  final _i15.Key? key;

  final String productTypeName;

  @override
  String toString() {
    return 'ProductsRouteArgs{key: $key, productTypeName: $productTypeName}';
  }
}

/// generated route for
/// [_i11.ProductDetailsView]
class ProductDetailsRoute extends _i14.PageRouteInfo<ProductDetailsRouteArgs> {
  ProductDetailsRoute({required dynamic productModel, _i15.Key? key})
      : super(ProductDetailsRoute.name,
            path: ':productModel',
            args: ProductDetailsRouteArgs(productModel: productModel, key: key),
            rawPathParams: {'productModel': productModel});

  static const String name = 'ProductDetailsRoute';
}

class ProductDetailsRouteArgs {
  const ProductDetailsRouteArgs({required this.productModel, this.key});

  final dynamic productModel;

  final _i15.Key? key;

  @override
  String toString() {
    return 'ProductDetailsRouteArgs{productModel: $productModel, key: $key}';
  }
}

/// generated route for
/// [_i12.CargoInfoView]
class CargoInfoRoute extends _i14.PageRouteInfo<CargoInfoRouteArgs> {
  CargoInfoRoute({_i15.Key? key})
      : super(CargoInfoRoute.name,
            path: '', args: CargoInfoRouteArgs(key: key));

  static const String name = 'CargoInfoRoute';
}

class CargoInfoRouteArgs {
  const CargoInfoRouteArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'CargoInfoRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i13.CargoEditView]
class CargoEditRouter extends _i14.PageRouteInfo<CargoEditRouterArgs> {
  CargoEditRouter({_i15.Key? key})
      : super(CargoEditRouter.name,
            path: 'cargoEditView', args: CargoEditRouterArgs(key: key));

  static const String name = 'CargoEditRouter';
}

class CargoEditRouterArgs {
  const CargoEditRouterArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'CargoEditRouterArgs{key: $key}';
  }
}
