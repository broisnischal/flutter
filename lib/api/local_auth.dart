// import 'dart:developer';

// import 'package:firebaseapp/main.dart';
// import 'package:firebaseapp/page/authenticated.dart';
// import 'package:flutter/services.dart';
// import 'package:local_auth/local_auth.dart';
// import 'package:local_auth_android/local_auth_android.dart';
// // import 'package:local_auth_darwin/local_auth_darwin.dart';

// class LocalAuth {
//   void authenticateLocal() async {
//     final LocalAuthentication auth = LocalAuthentication();

//     final List<BiometricType> availableBiometrics =
//         await auth.getAvailableBiometrics();

//     log(availableBiometrics.toString());

//     if (availableBiometrics.contains(BiometricType.strong) ||
//         availableBiometrics.contains(BiometricType.face)) {
//       try {
//         bool didAuthenticate =
//             await auth.authenticate(localizedReason: 'Please authenticate');
//         if (didAuthenticate) {
//           // Navigator.of(navigatorKey.currentContext).pushNamed(
//           //   NotificationScreen.routeName,
//           // );
//           log('user is authenticated');
//           navigatorKey.currentState?.pushNamed(
//             Authenticated.routeName,
//           );
//         }
//       } on PlatformException catch (e) {
//         log(e.toString());

//         // Handle error
//       }
//     }
//   }

//   Future<bool> authenticate() async {
//     final LocalAuthentication auth = LocalAuthentication();
//     try {
//       final bool didAuthenticate = await auth.authenticate(
//         localizedReason: 'Please authenticate to show account balance',
//         authMessages: const <AuthMessages>[
//           AndroidAuthMessages(
//             signInTitle: 'Oops! Biometric authentication required!',
//             cancelButton: 'No thanks',
//           ),
//         ],
//         options: const AuthenticationOptions(
//           biometricOnly: true,
//           sensitiveTransaction: true,
//         ),
//       );
//       return didAuthenticate;
//     } on PlatformException {
//       return false;
//     }
//   }
// }
