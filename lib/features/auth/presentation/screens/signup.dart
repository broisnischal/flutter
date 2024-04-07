import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fullfluttersetup/di/injection_config.dart';
import 'package:fullfluttersetup/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:fullfluttersetup/router/router.gr.dart';

@RoutePage(name: 'SignUp')
class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();

  final contactController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
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

              if (state is AuthSuccessWithOtp) {
                AutoRouter.of(context).push(
                  Otpverify(
                    hash: state.otp.hash,
                    phoneNumber: state.otp.phone,
                    otp: state.otp.otp,
                  ),
                );
              }
            },
            builder: (context, state) {
              return Scaffold(
                body: SafeArea(
                  minimum: const EdgeInsets.all(16),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Enter your phone number asd',
                          ),
                          controller: contactController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        8.verticalSpace,
                        GestureDetector(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              BlocProvider.of<AuthBloc>(context).add(
                                AuthSignUp(
                                  contactController.value.text,
                                ),
                              );
                            }
                          },
                          child: const Text('Sign Up'),
                        ),
                      ],
                    ),
                  ),
                ),
                appBar: AppBar(title: const Text('SignUp')),
              );
            },
          );
        },
      ),
    );
  }
}
