// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:fullfluttersetup/features/auth/presentation/screens/otpverify.dart'
    as _i3;
import 'package:fullfluttersetup/features/auth/presentation/screens/signup.dart'
    as _i5;
import 'package:fullfluttersetup/features/infinite_list/presentation/screens/post_page.dart'
    as _i4;
import 'package:fullfluttersetup/features/introduction_screen/presentation/screen/introduction.dart'
    as _i2;
import 'package:fullfluttersetup/features/profile/presentation/screens/homepage.dart'
    as _i1;
import 'package:fullfluttersetup/features/timer/presentation/screens/stepper_page.dart'
    as _i6;
import 'package:fullfluttersetup/features/timer/presentation/screens/timer_page.dart'
    as _i7;

abstract class $AppRouter extends _i8.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    HomePage.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    IntroductionPage.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.IntroductionPage(),
      );
    },
    Otpverify.name: (routeData) {
      final args = routeData.argsAs<OtpverifyArgs>();
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.OtpVerify(
          otp: args.otp,
          phoneNumber: args.phoneNumber,
          hash: args.hash,
          key: args.key,
        ),
      );
    },
    PostPageRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.PostsPage(),
      );
    },
    SignUp.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SignUp(),
      );
    },
    StepperPageRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.StepperPage(),
      );
    },
    TimerPageRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.TimerPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.HomePage]
class HomePage extends _i8.PageRouteInfo<void> {
  const HomePage({List<_i8.PageRouteInfo>? children})
      : super(
          HomePage.name,
          initialChildren: children,
        );

  static const String name = 'HomePage';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i2.IntroductionPage]
class IntroductionPage extends _i8.PageRouteInfo<void> {
  const IntroductionPage({List<_i8.PageRouteInfo>? children})
      : super(
          IntroductionPage.name,
          initialChildren: children,
        );

  static const String name = 'IntroductionPage';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i3.OtpVerify]
class Otpverify extends _i8.PageRouteInfo<OtpverifyArgs> {
  Otpverify({
    required String otp,
    required String phoneNumber,
    required String hash,
    _i9.Key? key,
    List<_i8.PageRouteInfo>? children,
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

  static const _i8.PageInfo<OtpverifyArgs> page =
      _i8.PageInfo<OtpverifyArgs>(name);
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

  final _i9.Key? key;

  @override
  String toString() {
    return 'OtpverifyArgs{otp: $otp, phoneNumber: $phoneNumber, hash: $hash, key: $key}';
  }
}

/// generated route for
/// [_i4.PostsPage]
class PostPageRoute extends _i8.PageRouteInfo<void> {
  const PostPageRoute({List<_i8.PageRouteInfo>? children})
      : super(
          PostPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'PostPageRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SignUp]
class SignUp extends _i8.PageRouteInfo<void> {
  const SignUp({List<_i8.PageRouteInfo>? children})
      : super(
          SignUp.name,
          initialChildren: children,
        );

  static const String name = 'SignUp';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i6.StepperPage]
class StepperPageRoute extends _i8.PageRouteInfo<void> {
  const StepperPageRoute({List<_i8.PageRouteInfo>? children})
      : super(
          StepperPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'StepperPageRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i7.TimerPage]
class TimerPageRoute extends _i8.PageRouteInfo<void> {
  const TimerPageRoute({List<_i8.PageRouteInfo>? children})
      : super(
          TimerPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'TimerPageRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}
