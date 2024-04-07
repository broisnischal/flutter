import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullfluttersetup/router/route_imports.gr.dart';

@RoutePage(name: 'LoginRoute')
class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Text('Login'),
      ),
      appBar: AppBar(
        title: const Text('Login'),
        actions: [
          IconButton(
            onPressed: () => context.router.push(const SignUp()),
            icon: const Icon(Icons.close),
          ),
        ],
      ),
    );
  }
}
