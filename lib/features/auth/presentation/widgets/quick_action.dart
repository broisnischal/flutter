import 'package:flutter/material.dart';

class QuickAction {
  QuickAction({
    required this.icon,
    required this.onTap,
    this.backgroundColor = Colors.white,
    this.iconColor,
  });
  final IconData icon;
  final Color backgroundColor;
  final Color? iconColor;
  final void Function() onTap;
}
