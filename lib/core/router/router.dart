import 'package:auto_route/auto_route.dart';
import 'package:diagnostic_app/core/router/router.gr.dart';

/// This class used for defined routes and paths na dother properties
@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  late final List<AutoRoute> routes = [
    AutoRoute(
      page: CounterRoute.page,
      path: '/counter',
    ),
    AutoRoute(
      page: HomeRoute.page,
      path: '/home',
      initial: true,
    ),
    AutoRoute(
      page: TermsAndConditionRoute.page,
      path: '/terms-and-conditions',
    ),
    AutoRoute(
      page: ContactDetailsRoute.page,
      path: '/contact-details',
    ),
    AutoRoute(
      page: CartRoute.page,
      path: '/cart',
    ),
  ];
}
