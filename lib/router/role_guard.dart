import 'dart:developer';

import 'package:auto_route/auto_route.dart';

class RoleGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // final requiredRole = router.current.meta['role'] as String;
    // final requiredRole = router.routeData.meta['role'] as String?;
    final requiredRole =
        resolver.pendingRoutes.first.args?.meta?['role'] as String?;

    log(requiredRole ?? 'no role');

    // Check if the user has the required role
    // final userRole = await UserRepository.getUserRole();

    const userRole = 'admin';

    // If the user has the required role, allow navigation
    if (userRole == requiredRole) {
      log('here');
      resolver.next();
    } else {
      // Otherwise, navigate to the home screen or display an error message
      router.pushNamed('/feed');
      return;
    }
  }
}
