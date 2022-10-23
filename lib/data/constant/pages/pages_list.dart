import 'package:auto_route/auto_route.dart';
import 'package:jista/core/router/auto_router/router.gr.dart';

class PagesList {
  static List<PageRouteInfo> get pagesList {
    return <PageRouteInfo>[
      const HomeRouter(),
      CargoEditRouter(),
      const OrderRouter(),
      RationRequestPeriodRouter(),
    ];
  }
}
