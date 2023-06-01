import 'package:flutter/material.dart';
import 'package:fan_side_drawer/fan_side_drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fan Side Drawer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  List<DrawerMenuItem> get menuItems => [
        DrawerMenuItem(title: 'Home', icon: Icons.house_rounded, iconSize: 15, onMenuTapped: () {}),
        DrawerMenuItem(
            title: 'Account Details',
            icon: Icons.account_circle_rounded,
            iconSize: 15,
            onMenuTapped: () {}),
        DrawerMenuItem(
            title: 'Profile', icon: Icons.info_rounded, iconSize: 15, onMenuTapped: () {}),
        DrawerMenuItem(
            title: 'Wallet', icon: Icons.wallet_rounded, iconSize: 15, onMenuTapped: () {}),
        DrawerMenuItem(
            title: 'Transaactions',
            icon: Icons.attach_money_rounded,
            iconSize: 15,
            onMenuTapped: () {}),
        DrawerMenuItem(
            title: 'Messages', icon: Icons.message_rounded, iconSize: 15, onMenuTapped: () {}),
        DrawerMenuItem(
            title: 'Tickets', icon: Icons.support_agent_rounded, iconSize: 15, onMenuTapped: () {}),
        DrawerMenuItem(
            title: 'Orders',
            icon: Icons.format_list_bulleted_rounded,
            iconSize: 15,
            onMenuTapped: () {}),
        DrawerMenuItem(
            title: 'App Settings', icon: Icons.adb_sharp, iconSize: 15, onMenuTapped: () {}),
        DrawerMenuItem(
            title: 'Notifications', icon: Icons.alarm_rounded, iconSize: 15, onMenuTapped: () {}),
        DrawerMenuItem(
            title: 'Subscribtion Plans',
            icon: Icons.question_answer_rounded,
            iconSize: 15,
            onMenuTapped: () {}),
        DrawerMenuItem(title: 'Shops', icon: Icons.store, iconSize: 15, onMenuTapped: () {}),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          width: 255,
          child: FanSideDrawer(
            drawerType: DrawerType.pipe,
            menuItems: menuItems,
          ),
        ),
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Custom SideBar"),
        ),
        body: const Center(
          child: Text("Wellcome! Checkout my Github :)"),
        ));
  }
}
