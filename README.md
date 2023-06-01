A fantasy and animated side drawer with all required properties for all platforms.

<image src="https://github.com/marjandn/fan_side_drawer/assets/25709266/34e8013e-52c1-4fab-bbd7-f415345f3e4e" width=500>
<image src="https://github.com/marjandn/fan_side_drawer/assets/25709266/9e263e7b-1c02-4240-a9a0-993e1d9fbfd9" width=500>

  
## Installation

In the `pubspec.yaml` of your flutter project, add the following dependency:

```yaml
dependencies:
  flutter:
    sdk:
  fan_side_drawer: any
```

Import the fantasy side drawer package like this: 

```dart
  import 'package:fan_side_drawer/fan_side_drawer.dart';
```
  
## Usage

Simply create a FanSideDrawer widget in the Drawer Widget of the Scaffold, and pass the required params:

```dart
  Scaffold(
        drawer: Drawer(
          width: 255,
          child: FanSideDrawer(
            menuItems: menuItems,
          ),
        ),
  ....
  );
```
  
## Customization
Customize the FanSideDrawer widget with these parameters:
```dart
  
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
```
