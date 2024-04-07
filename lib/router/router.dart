part of 'route_imports.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
  // generateForDir: 'lib/router',
)
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        CustomRoute(
          path: '/login',
          page: LoginRoute.page,
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
          guards: [
            AuthGuard(),
          ],
          // meta: const {
          //   'role': 'admin', // or 'user'
          // },
        ),
        // RedirectRoute(path: '/', redirectTo: '/feed'),
      ];

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {}
}
