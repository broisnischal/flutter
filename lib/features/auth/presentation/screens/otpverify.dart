import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fullfluttersetup/di/injection_config.dart';
import 'package:fullfluttersetup/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:pinput/pinput.dart';

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
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)),
                    );
                  }

                  if (state is AuthSuccessWithToken) {
                    log(state.tokenResponse.accessToken);
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
                        hapticFeedbackType: HapticFeedbackType.lightImpact,
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
                      // Text(otp),
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
