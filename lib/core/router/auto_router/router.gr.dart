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
import 'package:auto_route/auto_route.dart' as _i15;
import 'package:auto_route/empty_router_widgets.dart' as _i5;
import 'package:flutter/material.dart' as _i16;

import '../../../views/base/base_tabs_view.dart' as _i4;
import '../../../views/cargo/view/cargo_edit_view.dart' as _i12;
import '../../../views/cargo/view/cargo_info_view.dart' as _i11;
import '../../../views/cart/view/cart_image.dart' as _i14;
import '../../../views/cart/view/cart_view.dart' as _i13;
import '../../../views/entry/view/entry_view.dart' as _i2;
import '../../../views/home/view/home_view.dart' as _i8;
import '../../../views/order/view/order_view.dart' as _i6;
import '../../../views/period/view/ration_request_period_view.dart' as _i7;
import '../../../views/product/view/product_details_view.dart' as _i10;
import '../../../views/product/view/products_view.dart' as _i9;
import '../../../views/register/view/register_view.dart' as _i3;
import '../../../views/splash/view/splash_view.dart' as _i1;

class AutoRouter extends _i15.RootStackRouter {
  AutoRouter([_i16.GlobalKey<_i16.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i15.PageFactory> pagesMap = {
    SplashRouter.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashView());
    },
    EntryRoute.name: (routeData) {
      final args = routeData.argsAs<EntryRouteArgs>(
          orElse: () => const EntryRouteArgs());
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.EntryView(key: args.key));
    },
    RegisterRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterRouteArgs>(
          orElse: () => const RegisterRouteArgs());
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.RegisterView(key: args.key));
    },
    BaseTabsRoute.name: (routeData) {
      final args = routeData.argsAs<BaseTabsRouteArgs>(
          orElse: () => const BaseTabsRouteArgs());
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: _i4.BaseTabsView(key: args.key));
    },
    CartRouter.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.EmptyRouterPage());
    },
    HomeRouter.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.EmptyRouterPage());
    },
    CargoInfoRouter.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.EmptyRouterPage());
    },
    OrderRouter.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.OrderView());
    },
    RationRequestPeriodRouter.name: (routeData) {
      final args = routeData.argsAs<RationRequestPeriodRouterArgs>(
          orElse: () => const RationRequestPeriodRouterArgs());
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i7.RationRequestPeriodView(key: args.key));
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: _i8.HomeView(key: args.key));
    },
    ProductsRoute.name: (routeData) {
      final args = routeData.argsAs<ProductsRouteArgs>();
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i9.ProductsView(
              key: args.key, productTypeName: args.productTypeName));
    },
    ProductDetailsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ProductDetailsRouteArgs>(
          orElse: () => ProductDetailsRouteArgs(
              productModel: pathParams.get('productModel')));
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i10.ProductDetailsView(
              productModel: args.productModel, key: args.key));
    },
    CargoInfoRoute.name: (routeData) {
      final args = routeData.argsAs<CargoInfoRouteArgs>(
          orElse: () => const CargoInfoRouteArgs());
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: _i11.CargoInfoView(key: args.key));
    },
    CargoEditRouter.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CargoEditRouterArgs>(
          orElse: () => CargoEditRouterArgs(
              addressModel: pathParams.get('addressModel')));
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i12.CargoEditView(
              key: args.key, addressModel: args.addressModel));
    },
    CartRoute.name: (routeData) {
      final args =
          routeData.argsAs<CartRouteArgs>(orElse: () => const CartRouteArgs());
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: _i13.CartView(key: args.key));
    },
    CartImageRouter.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CartImageRouterArgs>(
          orElse: () =>
              CartImageRouterArgs(imageUrl: pathParams.get('imageUrl')));
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i14.CartImageView(key: args.key, imageUrl: args.imageUrl));
    }
  };

  @override
  List<_i15.RouteConfig> get routes => [
        _i15.RouteConfig(SplashRouter.name, path: '/'),
        _i15.RouteConfig(EntryRoute.name, path: 'entryView'),
        _i15.RouteConfig(RegisterRoute.name, path: 'registery'),
        _i15.RouteConfig(BaseTabsRoute.name, path: '/:personModel', children: [
          _i15.RouteConfig(HomeRouter.name,
              path: '',
              parent: BaseTabsRoute.name,
              children: [
                _i15.RouteConfig(HomeRoute.name,
                    path: '', parent: HomeRouter.name),
                _i15.RouteConfig(ProductsRoute.name,
                    path: ':productTypeName', parent: HomeRouter.name),
                _i15.RouteConfig(ProductDetailsRoute.name,
                    path: ':productModel', parent: HomeRouter.name)
              ]),
          _i15.RouteConfig(CargoInfoRouter.name,
              path: '',
              parent: BaseTabsRoute.name,
              children: [
                _i15.RouteConfig(CargoInfoRoute.name,
                    path: '', parent: CargoInfoRouter.name),
                _i15.RouteConfig(CargoEditRouter.name,
                    path: ':addressModel', parent: CargoInfoRouter.name)
              ]),
          _i15.RouteConfig(OrderRouter.name,
              path: 'orderView', parent: BaseTabsRoute.name),
          _i15.RouteConfig(RationRequestPeriodRouter.name,
              path: 'rationRequestPeriodView', parent: BaseTabsRoute.name)
        ]),
        _i15.RouteConfig(CartRouter.name, path: '', children: [
          _i15.RouteConfig(CartRoute.name, path: '', parent: CartRouter.name),
          _i15.RouteConfig(CartImageRouter.name,
              path: ':imageUrl', parent: CartRouter.name)
        ])
      ];
}

/// generated route for
/// [_i1.SplashView]
class SplashRouter extends _i15.PageRouteInfo<void> {
  const SplashRouter() : super(SplashRouter.name, path: '/');

  static const String name = 'SplashRouter';
}

/// generated route for
/// [_i2.EntryView]
class EntryRoute extends _i15.PageRouteInfo<EntryRouteArgs> {
  EntryRoute({_i16.Key? key})
      : super(EntryRoute.name,
            path: 'entryView', args: EntryRouteArgs(key: key));

  static const String name = 'EntryRoute';
}

class EntryRouteArgs {
  const EntryRouteArgs({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return 'EntryRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.RegisterView]
class RegisterRoute extends _i15.PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({_i16.Key? key})
      : super(RegisterRoute.name,
            path: 'registery', args: RegisterRouteArgs(key: key));

  static const String name = 'RegisterRoute';
}

class RegisterRouteArgs {
  const RegisterRouteArgs({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return 'RegisterRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.BaseTabsView]
class BaseTabsRoute extends _i15.PageRouteInfo<BaseTabsRouteArgs> {
  BaseTabsRoute({_i16.Key? key, List<_i15.PageRouteInfo>? children})
      : super(BaseTabsRoute.name,
            path: '/:personModel',
            args: BaseTabsRouteArgs(key: key),
            initialChildren: children);

  static const String name = 'BaseTabsRoute';
}

class BaseTabsRouteArgs {
  const BaseTabsRouteArgs({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return 'BaseTabsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.EmptyRouterPage]
class CartRouter extends _i15.PageRouteInfo<void> {
  const CartRouter({List<_i15.PageRouteInfo>? children})
      : super(CartRouter.name, path: '', initialChildren: children);

  static const String name = 'CartRouter';
}

/// generated route for
/// [_i5.EmptyRouterPage]
class HomeRouter extends _i15.PageRouteInfo<void> {
  const HomeRouter({List<_i15.PageRouteInfo>? children})
      : super(HomeRouter.name, path: '', initialChildren: children);

  static const String name = 'HomeRouter';
}

/// generated route for
/// [_i5.EmptyRouterPage]
class CargoInfoRouter extends _i15.PageRouteInfo<void> {
  const CargoInfoRouter({List<_i15.PageRouteInfo>? children})
      : super(CargoInfoRouter.name, path: '', initialChildren: children);

  static const String name = 'CargoInfoRouter';
}

/// generated route for
/// [_i6.OrderView]
class OrderRouter extends _i15.PageRouteInfo<void> {
  const OrderRouter() : super(OrderRouter.name, path: 'orderView');

  static const String name = 'OrderRouter';
}

/// generated route for
/// [_i7.RationRequestPeriodView]
class RationRequestPeriodRouter
    extends _i15.PageRouteInfo<RationRequestPeriodRouterArgs> {
  RationRequestPeriodRouter({_i16.Key? key})
      : super(RationRequestPeriodRouter.name,
            path: 'rationRequestPeriodView',
            args: RationRequestPeriodRouterArgs(key: key));

  static const String name = 'RationRequestPeriodRouter';
}

class RationRequestPeriodRouterArgs {
  const RationRequestPeriodRouterArgs({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return 'RationRequestPeriodRouterArgs{key: $key}';
  }
}

/// generated route for
/// [_i8.HomeView]
class HomeRoute extends _i15.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({_i16.Key? key})
      : super(HomeRoute.name, path: '', args: HomeRouteArgs(key: key));

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i9.ProductsView]
class ProductsRoute extends _i15.PageRouteInfo<ProductsRouteArgs> {
  ProductsRoute({_i16.Key? key, required String productTypeName})
      : super(ProductsRoute.name,
            path: ':productTypeName',
            args:
                ProductsRouteArgs(key: key, productTypeName: productTypeName));

  static const String name = 'ProductsRoute';
}

class ProductsRouteArgs {
  const ProductsRouteArgs({this.key, required this.productTypeName});

  final _i16.Key? key;

  final String productTypeName;

  @override
  String toString() {
    return 'ProductsRouteArgs{key: $key, productTypeName: $productTypeName}';
  }
}

/// generated route for
/// [_i10.ProductDetailsView]
class ProductDetailsRoute extends _i15.PageRouteInfo<ProductDetailsRouteArgs> {
  ProductDetailsRoute({required dynamic productModel, _i16.Key? key})
      : super(ProductDetailsRoute.name,
            path: ':productModel',
            args: ProductDetailsRouteArgs(productModel: productModel, key: key),
            rawPathParams: {'productModel': productModel});

  static const String name = 'ProductDetailsRoute';
}

class ProductDetailsRouteArgs {
  const ProductDetailsRouteArgs({required this.productModel, this.key});

  final dynamic productModel;

  final _i16.Key? key;

  @override
  String toString() {
    return 'ProductDetailsRouteArgs{productModel: $productModel, key: $key}';
  }
}

/// generated route for
/// [_i11.CargoInfoView]
class CargoInfoRoute extends _i15.PageRouteInfo<CargoInfoRouteArgs> {
  CargoInfoRoute({_i16.Key? key})
      : super(CargoInfoRoute.name,
            path: '', args: CargoInfoRouteArgs(key: key));

  static const String name = 'CargoInfoRoute';
}

class CargoInfoRouteArgs {
  const CargoInfoRouteArgs({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return 'CargoInfoRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i12.CargoEditView]
class CargoEditRouter extends _i15.PageRouteInfo<CargoEditRouterArgs> {
  CargoEditRouter({_i16.Key? key, dynamic addressModel})
      : super(CargoEditRouter.name,
            path: ':addressModel',
            args: CargoEditRouterArgs(key: key, addressModel: addressModel),
            rawPathParams: {'addressModel': addressModel});

  static const String name = 'CargoEditRouter';
}

class CargoEditRouterArgs {
  const CargoEditRouterArgs({this.key, this.addressModel});

  final _i16.Key? key;

  final dynamic addressModel;

  @override
  String toString() {
    return 'CargoEditRouterArgs{key: $key, addressModel: $addressModel}';
  }
}

/// generated route for
/// [_i13.CartView]
class CartRoute extends _i15.PageRouteInfo<CartRouteArgs> {
  CartRoute({_i16.Key? key})
      : super(CartRoute.name, path: '', args: CartRouteArgs(key: key));

  static const String name = 'CartRoute';
}

class CartRouteArgs {
  const CartRouteArgs({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return 'CartRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i14.CartImageView]
class CartImageRouter extends _i15.PageRouteInfo<CartImageRouterArgs> {
  CartImageRouter({_i16.Key? key, dynamic imageUrl})
      : super(CartImageRouter.name,
            path: ':imageUrl',
            args: CartImageRouterArgs(key: key, imageUrl: imageUrl),
            rawPathParams: {'imageUrl': imageUrl});

  static const String name = 'CartImageRouter';
}

class CartImageRouterArgs {
  const CartImageRouterArgs({this.key, this.imageUrl});

  final _i16.Key? key;

  final dynamic imageUrl;

  @override
  String toString() {
    return 'CartImageRouterArgs{key: $key, imageUrl: $imageUrl}';
  }
}
