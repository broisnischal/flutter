import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:fullfluttersetup/core/storage/flutter_secure_storage.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    // final accessToken = await FlutterSecure.read('accessToken');
    // log(accessToken!); // next time verify to the repository token and only use

    final isAuthenticated = await FlutterSecure.read('accessToken') != null;
    log(isAuthenticated.toString());

    if (!isAuthenticated) {
      // resolver.redirect(const SignUp());
      // router.push(const SignUp());
    }

    resolver.next();

    // if (isAuthenticated && resolver.routeName != 'SignUp') {
    //   resolver.next();
    // } else if (isAuthenticated && resolver.routeName == 'SignUp') {
    //   resolver.redirect(const HomePage());
    // } else {
    //   resolver.redirect(const SignUp());
    // }
  }
}
