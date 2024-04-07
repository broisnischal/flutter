// import 'dart:developer';

// import 'package:auto_route/auto_route.dart';
// import 'package:fullfluttersetup/router/route_imports.gr.dart';

// class AuthGuard extends AutoRouteGuard {
//   @override
//   Future<void> onNavigation(
//     NavigationResolver resolver,
//     StackRouter router,
//   ) async {
//     // Check if the user is authenticated
//     // final isAuthenticated = await UserRepository.isAuthenticated();

//     const isAuthenticated = false;

//     if (isAuthenticated) {
//       resolver.next(true);
//     } else {
//       resolver.redirect(const LoginRoute());
//     }

//     // If the user is not authenticated, navigate to the login screen
//   }
// }
