import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage(name: 'WebSocketRealtimeRoute')
class WebSocketRealtime extends StatelessWidget {
  const WebSocketRealtime({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebSocket'),
      ),
      body: const Center(child: Text('WebSocket')),
    );
  }
}
