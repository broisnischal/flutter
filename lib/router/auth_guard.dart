// import 'package:auto_route/auto_route.dart';

// class AuthGuard extends AutoRouteGuard {
//   @override
//   Future<void> onNavigation(
//     NavigationResolver resolver,
//     StackRouter router,
//   ) async {
//     // Check if the user is authenticated
//     // final isAuthenticated = await UserRepository.isAuthenticated();

//     const isAuthenticated = false;

//     print(isAuthenticated);
//     print('tesitn');

//     // If not authenticated, navigate to the login screen
//     if (!isAuthenticated) {
//       router.pushNamed('/login');
//     }

//     // If authenticated, allow navigation
//     if (isAuthenticated) {
//       resolver.next();
//     }

//     // Else, allow navigation
//   }
// }
