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
          page: IntroductionPage.page,
        ),
        AutoRoute(
          page: SignUp.page,
          path: '/signup',
        ),

        AutoRoute(page: Otpverify.page),
        AutoRoute(
          page: HomePage.page,
        ),
        AutoRoute(
          page: PostPageRoute.page,
        ),
        AutoRoute(
          page: TimerPageRoute.page,
        ),
        AutoRoute(page: StepperPageRoute.page, initial: true),
        // AutoRoute(
        //   page: SignUp.route,
        // ),
      ];
}
