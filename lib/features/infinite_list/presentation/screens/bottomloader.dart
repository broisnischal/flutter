import 'package:flutter/material.dart';

class BottomLoader extends StatelessWidget {
  const BottomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8),
      child: Center(
        child: SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator.adaptive(strokeWidth: 2),
        ),
      ),
    );
  }
}
