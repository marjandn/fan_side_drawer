import 'package:flutter/material.dart';

import '../model/drawer_menu_item.dart';

class BoxDrawer extends StatefulWidget {
  const BoxDrawer({
    super.key,
    required this.menuItems,
    required this.drawerItemsHeight,
    required this.drawerItemsWidth,
    required this.selectedColor,
    required this.unSelectedColor,
    required this.selectedItemBackgroundColor,
    required this.animationDuration,
    required this.boxDrawerItemRadius,
    required this.menuTextStyle,
  });

  final Color selectedColor;
  final Color unSelectedColor;
  final Color selectedItemBackgroundColor;
  final List<DrawerMenuItem> menuItems;
  final double drawerItemsWidth;
  final double drawerItemsHeight;
  final Duration animationDuration;
  final BorderRadius boxDrawerItemRadius;
  final TextStyle menuTextStyle;

  @override
  State<BoxDrawer> createState() => _BoxDrawerState();
}

class _BoxDrawerState extends State<BoxDrawer> {
  late int selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: widget.animationDuration,
                top: widget.drawerItemsHeight * selectedPageIndex,
                child: Container(
                  height: widget.drawerItemsHeight,
                  width: widget.drawerItemsWidth,
                  decoration: BoxDecoration(
                      color: widget.selectedItemBackgroundColor,
                      borderRadius: widget.boxDrawerItemRadius),
                ),
              ),
              Column(
                  children: widget.menuItems
                      .asMap()
                      .map((int i, DrawerMenuItem page) => MapEntry(
                          i,
                          SizedBox(
                            height: widget.drawerItemsHeight,
                            width: widget.drawerItemsWidth,
                            child: InkWell(
                              borderRadius: widget.boxDrawerItemRadius,
                              onTap: () {
                                page.onMenuTapped.call();
                                setState(() {
                                  selectedPageIndex = i;
                                });
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: widget.drawerItemsWidth * .2,
                                  ),
                                  switch ((page.prefixWidget, page.icon)) {
                                    (var prefWidget?, _) => prefWidget,
                                    (_, var icon?) => Icon(
                                        icon,
                                        size: page.iconSize,
                                        color: selectedPageIndex == i
                                            ? widget.selectedColor
                                            : widget.unSelectedColor,
                                      ),
                                    _ => Icon(
                                        Icons.info_outline_rounded,
                                        color: selectedPageIndex == i
                                            ? widget.selectedColor
                                            : widget.unSelectedColor,
                                      )
                                  },
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(
                                      child: Text(
                                    page.title,
                                    style: widget.menuTextStyle.copyWith(
                                      fontWeight: selectedPageIndex == i ? FontWeight.bold : null,
                                      color: selectedPageIndex == i
                                          ? widget.selectedColor
                                          : widget.unSelectedColor,
                                    ),
                                  )),
                                ],
                              ),
                            ),
                          )))
                      .values
                      .toList()),
            ],
          ),
        ),
      ],
    );
  }
}
