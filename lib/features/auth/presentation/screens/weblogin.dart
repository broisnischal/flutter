import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullfluttersetup/features/auth/presentation/widgets/quick_action.dart';
import 'package:fullfluttersetup/features/auth/presentation/widgets/quick_action_menu.dart';

@RoutePage(name: 'WebLoginRoute')
class WebLogin extends StatefulWidget {
  const WebLogin({super.key});

  @override
  State<WebLogin> createState() => _WebLoginState();
}

class _WebLoginState extends State<WebLogin> {
  StreamController<String> streamController = StreamController<String>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Web login'),
      ),
      body: const Text('Floating action button'),
      floatingActionButton: QuickActionMenu(
        actions: [
          QuickAction(icon: Icons.add, onTap: () {}),
          QuickAction(icon: Icons.shape_line, onTap: () {}),
          QuickAction(icon: Icons.add, onTap: () {}),
        ],
        onTap: () async {},
        icon: Icons.add,
        backgroundColor: Colors.red,
        child: const SizedBox.shrink(),
      ),
      // body: StreamBuilder(
      //   stream: streamController.stream,
      //   builder: (context, snapshot) {
      //     if (snapshot.hasData) {
      //       return Text(snapshot.data!);
      //     }

      //     return const Center(
      //       child: CircularProgressIndicator(),
      //     );
      //   },
      // ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
