// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:fullfluttersetup/features/auth/presentation/screens/admin.dart'
    as _i1;
import 'package:fullfluttersetup/features/auth/presentation/screens/home.dart'
    deferred as _i3;
import 'package:fullfluttersetup/features/auth/presentation/screens/login.dart'
    as _i4;
import 'package:fullfluttersetup/features/auth/presentation/screens/signup.dart'
    as _i6;
import 'package:fullfluttersetup/features/profile/presentation/screens/detail.dart'
    as _i2;
import 'package:fullfluttersetup/features/profile/presentation/screens/profile.dart'
    as _i5;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    Admin.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.Admin(),
      );
    },
    DetailPage.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.Detail(),
      );
    },
    Home.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.DeferredWidget(
          _i3.loadLibrary,
          () => _i3.Home(),
        ),
      );
    },
    LoginRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.Login(),
      );
    },
    Profile.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.Profile(),
      );
    },
    SignUp.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.SignUp(),
      );
    },
  };
}

/// generated route for
/// [_i1.Admin]
class Admin extends _i7.PageRouteInfo<void> {
  const Admin({List<_i7.PageRouteInfo>? children})
      : super(
          Admin.name,
          initialChildren: children,
        );

  static const String name = 'Admin';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.Detail]
class DetailPage extends _i7.PageRouteInfo<void> {
  const DetailPage({List<_i7.PageRouteInfo>? children})
      : super(
          DetailPage.name,
          initialChildren: children,
        );

  static const String name = 'DetailPage';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.Home]
class Home extends _i7.PageRouteInfo<void> {
  const Home({List<_i7.PageRouteInfo>? children})
      : super(
          Home.name,
          initialChildren: children,
        );

  static const String name = 'Home';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.Login]
class LoginRoute extends _i7.PageRouteInfo<void> {
  const LoginRoute({List<_i7.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.Profile]
class Profile extends _i7.PageRouteInfo<void> {
  const Profile({List<_i7.PageRouteInfo>? children})
      : super(
          Profile.name,
          initialChildren: children,
        );

  static const String name = 'Profile';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.SignUp]
class SignUp extends _i7.PageRouteInfo<void> {
  const SignUp({List<_i7.PageRouteInfo>? children})
      : super(
          SignUp.name,
          initialChildren: children,
        );

  static const String name = 'SignUp';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
