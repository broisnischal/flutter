// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:fullfluttersetup/features/auth/presentation/screens/login.dart'
    as _i1;
import 'package:fullfluttersetup/features/auth/presentation/screens/otpverify.dart'
    as _i2;
import 'package:fullfluttersetup/features/auth/presentation/screens/signup.dart'
    as _i3;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.Login(),
      );
    },
    Otpverify.name: (routeData) {
      final args = routeData.argsAs<OtpverifyArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.OtpVerify(
          otp: args.otp,
          phoneNumber: args.phoneNumber,
          hash: args.hash,
          key: args.key,
        ),
      );
    },
    SignUp.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SignUp(),
      );
    },
  };
}

/// generated route for
/// [_i1.Login]
class LoginRoute extends _i4.PageRouteInfo<void> {
  const LoginRoute({List<_i4.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.OtpVerify]
class Otpverify extends _i4.PageRouteInfo<OtpverifyArgs> {
  Otpverify({
    required String otp,
    required String phoneNumber,
    required String hash,
    _i5.Key? key,
    List<_i4.PageRouteInfo>? children,
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

  static const _i4.PageInfo<OtpverifyArgs> page =
      _i4.PageInfo<OtpverifyArgs>(name);
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

  final _i5.Key? key;

  @override
  String toString() {
    return 'OtpverifyArgs{otp: $otp, phoneNumber: $phoneNumber, hash: $hash, key: $key}';
  }
}

/// generated route for
/// [_i3.SignUp]
class SignUp extends _i4.PageRouteInfo<void> {
  const SignUp({List<_i4.PageRouteInfo>? children})
      : super(
          SignUp.name,
          initialChildren: children,
        );

  static const String name = 'SignUp';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
