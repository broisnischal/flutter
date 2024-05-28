// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;
import 'package:fullfluttersetup/features/auth/presentation/screens/otpverify.dart'
    as _i3;
import 'package:fullfluttersetup/features/auth/presentation/screens/signup.dart'
    as _i6;
import 'package:fullfluttersetup/features/auth/presentation/screens/weblogin.dart'
    as _i9;
import 'package:fullfluttersetup/features/infinite_list/presentation/screens/post_page.dart'
    as _i5;
import 'package:fullfluttersetup/features/introduction_screen/presentation/screen/introduction.dart'
    as _i2;
import 'package:fullfluttersetup/features/pagination/presentation/screens/pagination.dart'
    as _i4;
import 'package:fullfluttersetup/features/profile/presentation/screens/homepage.dart'
    as _i1;
import 'package:fullfluttersetup/features/timer/presentation/screens/stepper_page.dart'
    as _i7;
import 'package:fullfluttersetup/features/timer/presentation/screens/timer_page.dart'
    as _i8;

abstract class $AppRouter extends _i10.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    HomePage.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    IntroductionPage.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.IntroductionPage(),
      );
    },
    Otpverify.name: (routeData) {
      final args = routeData.argsAs<OtpverifyArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.OtpVerify(
          otp: args.otp,
          phoneNumber: args.phoneNumber,
          hash: args.hash,
          key: args.key,
        ),
      );
    },
    PaginationScreen.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.PaginationScreen(),
      );
    },
    PostPageRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.PostsPage(),
      );
    },
    SignUp.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.SignUp(),
      );
    },
    StepperPageRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.StepperPage(),
      );
    },
    TimerPageRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.TimerPage(),
      );
    },
    WebLoginRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.WebLogin(),
      );
    },
  };
}

/// generated route for
/// [_i1.HomePage]
class HomePage extends _i10.PageRouteInfo<void> {
  const HomePage({List<_i10.PageRouteInfo>? children})
      : super(
          HomePage.name,
          initialChildren: children,
        );

  static const String name = 'HomePage';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i2.IntroductionPage]
class IntroductionPage extends _i10.PageRouteInfo<void> {
  const IntroductionPage({List<_i10.PageRouteInfo>? children})
      : super(
          IntroductionPage.name,
          initialChildren: children,
        );

  static const String name = 'IntroductionPage';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i3.OtpVerify]
class Otpverify extends _i10.PageRouteInfo<OtpverifyArgs> {
  Otpverify({
    required String otp,
    required String phoneNumber,
    required String hash,
    _i11.Key? key,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          Otpverify.name,
          args: OtpverifyArgs(
            otp: otp,
            phoneNumber: phoneNumber,
            hash: hash,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'Otpverify';

  static const _i10.PageInfo<OtpverifyArgs> page =
      _i10.PageInfo<OtpverifyArgs>(name);
}

class OtpverifyArgs {
  const OtpverifyArgs({
    required this.otp,
    required this.phoneNumber,
    required this.hash,
    this.key,
  });

  final String otp;

  final String phoneNumber;

  final String hash;

  final _i11.Key? key;

  @override
  String toString() {
    return 'OtpverifyArgs{otp: $otp, phoneNumber: $phoneNumber, hash: $hash, key: $key}';
  }
}

/// generated route for
/// [_i4.PaginationScreen]
class PaginationScreen extends _i10.PageRouteInfo<void> {
  const PaginationScreen({List<_i10.PageRouteInfo>? children})
      : super(
          PaginationScreen.name,
          initialChildren: children,
        );

  static const String name = 'PaginationScreen';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i5.PostsPage]
class PostPageRoute extends _i10.PageRouteInfo<void> {
  const PostPageRoute({List<_i10.PageRouteInfo>? children})
      : super(
          PostPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'PostPageRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i6.SignUp]
class SignUp extends _i10.PageRouteInfo<void> {
  const SignUp({List<_i10.PageRouteInfo>? children})
      : super(
          SignUp.name,
          initialChildren: children,
        );

  static const String name = 'SignUp';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i7.StepperPage]
class StepperPageRoute extends _i10.PageRouteInfo<void> {
  const StepperPageRoute({List<_i10.PageRouteInfo>? children})
      : super(
          StepperPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'StepperPageRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i8.TimerPage]
class TimerPageRoute extends _i10.PageRouteInfo<void> {
  const TimerPageRoute({List<_i10.PageRouteInfo>? children})
      : super(
          TimerPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'TimerPageRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i9.WebLogin]
class WebLoginRoute extends _i10.PageRouteInfo<void> {
  const WebLoginRoute({List<_i10.PageRouteInfo>? children})
      : super(
          WebLoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'WebLoginRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}
