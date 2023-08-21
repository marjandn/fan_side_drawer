import 'package:flutter/material.dart';

import '../model/drawer_menu_item.dart';

class PipeDrawer extends StatefulWidget {
  const PipeDrawer({
    super.key,
    required this.menuItems,
    required this.drawerItemsHeight,
    required this.drawerItemsWidth,
    required this.selectedColor,
    required this.unSelectedColor,
    required this.selectedItemBackgroundColor,
    required this.animationDuration,
    required this.menuTextStyle,
  });

  final Color selectedColor;
  final Color unSelectedColor;
  final Color selectedItemBackgroundColor;
  final List<DrawerMenuItem> menuItems;
  final double drawerItemsWidth;
  final double drawerItemsHeight;
  final Duration animationDuration;
  final TextStyle menuTextStyle;

  @override
  State<PipeDrawer> createState() => _PipeDrawerState();
}

class _PipeDrawerState extends State<PipeDrawer> {
  late int selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      ...widget.menuItems
          .asMap()
          .map((int i, DrawerMenuItem page) => MapEntry(
              i,
              Stack(
                children: [
                  AnimatedContainer(
                    duration: widget.animationDuration,
                    height: widget.drawerItemsHeight,
                    width: (i == selectedPageIndex) ? widget.drawerItemsWidth : 0,
                    decoration: BoxDecoration(
                        color: widget.selectedItemBackgroundColor,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        )),
                  ),
                  SizedBox(
                    height: widget.drawerItemsHeight,
                    width: widget.drawerItemsWidth,
                    child: InkWell(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      onTap: () async{
                        await widget.menuItems[i].onMenuTapped;
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
                  ),
                ],
              )))
          .values
          .toList(),
    ]);
  }
}
