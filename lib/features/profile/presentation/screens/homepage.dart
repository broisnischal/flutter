import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullfluttersetup/core/storage/flutter_secure_storage.dart';

@RoutePage(name: 'HomePage')
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.all(16),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: FlutterSecure.deleteAll,
              child: Text('Logout'),
            ),
            Center(
              child: Text('Home Page'),
            ),
          ],
        ),
      ),
    );
  }
}
