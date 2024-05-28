import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fullfluttersetup/core/storage/flutter_secure_storage.dart';
import 'package:fullfluttersetup/core/utils/snack_bar.dart';
import 'package:fullfluttersetup/di/injection_config.dart';
import 'package:fullfluttersetup/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:fullfluttersetup/router/router.gr.dart';
import 'package:pinput/pinput.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage(name: 'otpverify')
class OtpVerify extends StatelessWidget {
  const OtpVerify({
    required this.otp,
    required this.phoneNumber,
    required this.hash,
    super.key,
  });
  final String phoneNumber;
  final String hash;
  final String otp;

  Future<void> readNfc() async {
    final tag = await FlutterNfcKit.poll();
    log('Tag found: ${tag.applicationData}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: BlocProvider(
          create: (context) => getIt<AuthBloc>(),
          child: Builder(
            builder: (context) {
              return BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthError) {
                    showSnackBar(
                      context: context,
                      title: 'OTP Error',
                      content: state.message,
                    );
                  }

                  if (state is AuthSuccessWithToken) {
                    FlutterSecure.write(
                      key: 'accessToken',
                      value: state.tokenResponse.accessToken,
                    );

                    FlutterSecure.write(
                      key: 'refreshToken',
                      value: state.tokenResponse.refreshToken,
                    );

                    AutoRouter.of(context).push(const WebLoginRoute());
                  }
                },
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      100.verticalSpace,
                      const Text(
                        'Verify OTP',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Pinput(
                        senderPhoneNumber: phoneNumber,
                        length: 6,
                        autofocus: true,
                        defaultPinTheme: PinTheme(
                          textStyle: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.black,
                          ),
                          width: 64,
                          height: 64,
                          constraints: const BoxConstraints(),
                          decoration: BoxDecoration(
                            backgroundBlendMode: BlendMode.darken,
                            color: const Color.fromARGB(255, 240, 240, 240),
                            border: Border.all(
                              color: const Color.fromARGB(255, 210, 210, 210),
                            ),
                            // color: Colors.white,

                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        // hapticFeedbackType: HapticFeedbackType.lightImpact,
                        onCompleted: (value) {
                          BlocProvider.of<AuthBloc>(context).add(
                            OTPVerify(
                              hash: hash,
                              phoneNumber: phoneNumber,
                              otp: value,
                            ),
                          );
                        },
                      ),
                      Text(otp),
                      TextButton(
                        onPressed: () => launchUrl(
                          Uri.parse(
                            'nischal://nischal.pages.dev/reset-password',
                          ),
                        ),
                        child: Text(
                          'Resend OTP link',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
