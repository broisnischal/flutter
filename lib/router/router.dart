part of 'route_imports.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
  // generateForDir: 'lib/router',
)
class AppRouter extends $AppRouter implements AutoRouteGuard {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  bool get isAuthenticated => false;

  @override
  List<AutoRoute> get routes => [
        CustomRoute(
          path: '/login',
          page: LoginRoute.page,
          transitionsBuilder: TransitionsBuilders.slideTop,
        ),
        AutoRoute(page: SignUp.page),
        // RedirectRoute(path: '/', redirectTo: '/feed'),
        AutoRoute(path: '/feed', page: Home.page),
        AutoRoute(
          path: '/profile',
          page: Profile.page,
          children: [
            AutoRoute(page: DetailPage.page),
          ],
        ),
        // AutoRoute(path: '/admin', page: Admin.page),

        AutoRoute(
          path: '/',
          page: Admin.page,
          initial: true,
          // meta: const {
          //   'role': 'admin', // or 'user'
          // },
        ),
        // RedirectRoute(path: '/', redirectTo: '/feed'),
      ];

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (isAuthenticated || resolver.route.name == LoginRoute.name) {
      resolver.next();
    } else {
      router.pushNamed('/login');
    }
  }
}
