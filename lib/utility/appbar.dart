// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const MyAppBar({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  State<MyAppBar> createState() => _MyAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "Slesa",
        style: Theme.of(context).appBarTheme.titleTextStyle,
      ),
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {
          if (widget.scaffoldKey.currentState != null) {
            if (widget.scaffoldKey.currentState!.isDrawerOpen) {
              widget.scaffoldKey.currentState!.openEndDrawer();
            } else {
              widget.scaffoldKey.currentState!.openDrawer();
            }
          }
        },
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.notifications, size: 30),
        )
      ],
    );
  }
}
