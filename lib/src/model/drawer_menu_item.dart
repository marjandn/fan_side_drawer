import 'package:flutter/material.dart';

class DrawerMenuItem {
  final Widget? prefixWidget;
  final IconData? icon;
  final double? iconSize;
  final String title;
  final Function onMenuTapped;

  DrawerMenuItem({
    required this.title,
    required this.onMenuTapped,
    this.iconSize,
    this.icon,
    this.prefixWidget,
  });
}
