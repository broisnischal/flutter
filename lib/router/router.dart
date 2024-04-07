import 'package:auto_route/auto_route.dart';

import 'package:fullfluttersetup/router/router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SignUp.page,
          initial: true,
        ),
        AutoRoute(
          page: LoginRoute.page,
        ),
        AutoRoute(page: Otpverify.page),
        // AutoRoute(
        //   page: SignUp.route,
        // ),
      ];
}
