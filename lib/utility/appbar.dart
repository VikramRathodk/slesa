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
        style: TextStyle(color: Colors.white),
      ),
      leading: IconButton(
        icon: Icon(Icons.menu, color: Colors.white),
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
      backgroundColor: Colors.blue.shade300,
      centerTitle: true,
      actions: [
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Image(
            image: AssetImage('assets/images/notification-bell.png'),
          ),
        )
      ],
    );
  }
}
