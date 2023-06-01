import 'package:flutter/material.dart';

import 'drawer_types/box_drawer.dart';
import 'drawer_types/drawer_type.dart';
import 'drawer_types/pipe_drawer.dart';
import 'model/drawer_menu_item.dart';

class FanSideDrawer extends StatelessWidget {
  const FanSideDrawer({
    super.key,
    required this.menuItems,
    this.drawerItemsWidth = 230,
    this.drawerItemsHeight = 60,
    this.drawerType = DrawerType.pipe,
    this.menuItemTextStyle = const TextStyle(fontSize: 14),
    this.selectedColor = Colors.purple,
    this.selectedItemBackgroundColor = const Color(0x41A951F1),
    this.unSelectedColor = Colors.grey,
    this.drawerPadding = const EdgeInsetsDirectional.symmetric(vertical: 24),
    this.animationDuration = const Duration(milliseconds: 600),
    this.boxDrawerItemRadius = const BorderRadius.all(Radius.circular(40)),
  });

  /// Defines duration value for all animations used.
  /// Defaults to Duration(milliseconds: 600).
  final Duration animationDuration;

  /// Defines selected text and icon color;
  /// This color applied to menu icon only if you define an [IconData] for the menu item
  /// Defaults to Colors.purple
  final Color selectedColor;

  /// Defines un selected text and icon color;
  /// This color applied to menu icon only if you define an [IconData] for the menu item
  /// Defaults to Colors.grey
  final Color unSelectedColor;

  /// Defines the text style for menu items.
  /// Defaults to TextStyle(fontSize: 14)
  final TextStyle menuItemTextStyle;

  /// Defines the background color of the selected menu item.
  /// Defautls to Color(0x41A951F1)
  final Color selectedItemBackgroundColor;

  /// Defines the Drawer animation type; You must select an item from [DrawerType] enum.
  /// Defaults to DrawerType.pipe
  final DrawerType drawerType;

  /// Defines the width for drawer items.
  /// Defaults to 230.
  final double drawerItemsWidth;

  /// Defines the height for drawer items.
  /// Defaults to 230.
  final double drawerItemsHeight;

  /// Defines a list for drawer items. You must use [MenuItem] class to define drawer items.
  final List<DrawerMenuItem> menuItems;

  /// Defines padding for the drawer.
  /// Defaults to EdgeInsetsDirectional.symmetric(vertical: 24)
  final EdgeInsetsGeometry drawerPadding;

  /// Defines the corner radius for the selected box, only in the [DrawerType.box] mode.
  /// Defaults to const BorderRadius.all(Radius.circular(40))
  final BorderRadius boxDrawerItemRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: drawerItemsWidth * 1.1,
        height: double.infinity,
        padding: drawerPadding,
        child: (drawerType == DrawerType.pipe)
            ? PipeDrawer(
                menuItems: menuItems,
                drawerItemsHeight: drawerItemsHeight,
                drawerItemsWidth: drawerItemsWidth,
                selectedColor: selectedColor,
                unSelectedColor: unSelectedColor,
                selectedItemBackgroundColor: selectedItemBackgroundColor,
                animationDuration: animationDuration,
                menuTextStyle: menuItemTextStyle,
              )
            : BoxDrawer(
                menuItems: menuItems,
                drawerItemsHeight: drawerItemsHeight,
                drawerItemsWidth: drawerItemsWidth,
                selectedColor: selectedColor,
                unSelectedColor: unSelectedColor,
                selectedItemBackgroundColor: selectedItemBackgroundColor,
                animationDuration: animationDuration,
                boxDrawerItemRadius: boxDrawerItemRadius,
                menuTextStyle: menuItemTextStyle,
              ));
  }
}
