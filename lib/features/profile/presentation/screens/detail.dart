import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage(name: 'DetailPage')
class Detail extends StatelessWidget {
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Text('Detail'),
      ),
      appBar: AppBar(title: const Text('Detail')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: const Icon(Icons.home),
      ),
    );
  }
}
