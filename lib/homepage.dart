// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:Note/pages/moreFragment.dart';
import 'package:Note/pages/seachFragment.dart';
import 'package:flutter/material.dart';
import 'pages/FavoritesFragment.dart';
import 'pages/HomePageFragment.dart';
import 'pages/SettingsFragment.dart';
import 'utility/appbar.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter_switch/flutter_switch.dart';

class HomePage extends StatefulWidget {
    final VoidCallback toggleTheme;

  const HomePage({super.key,required this.toggleTheme});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _currentPage = 'All Notes';
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool status = false;
  ThemeData _currentTheme = ThemeData.light();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: MyAppBar(
        scaffoldKey: scaffoldKey,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: Row(
                children: [
                  CircleAvatar(
                    child: Image.network(
                      "data:image/png;base64,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",
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ListTile(
                      title: Text(
                        "Header Drawer",
                      ),
                    ),
                  ),
                  // FlutterSwitch(
                  //   width: 65.0,
                  //   height: 30.0,
                  //   valueFontSize: 15.0,
                  //   toggleSize: 15.0,
                  //   value: status,
                  //   borderRadius: 10.0,
                  //   duration: Duration(milliseconds: 200),
                  //   showOnOff: true,
                  //   onToggle: (val) {
                  //     setState(() {
                  //       status = val;
                  //     });
                  //   },
                  // ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 2.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(4),
                  bottom: Radius.circular(4),
                ),
              ),
              child: ListTile(
                title: Text("Home"),
                leading: Icon(Icons.home),
                onTap: () {
                  setState(() {
                    _currentPage = 'All Notes';
                  });
                  Navigator.pop(context);
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 2.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(4),
                  bottom: Radius.circular(4),
                ),
              ),
              child: ListTile(
                title: Text("Settings"),
                leading: Icon(Icons.settings),
                onTap: () {
                  setState(() {
                    _currentPage = 'Settings';
                  });
                  Navigator.pop(context);
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 2.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(4),
                  bottom: Radius.circular(4),
                ),
              ),
              child: ListTile(
                title: Text("Logout"),
                leading: Icon(Icons.door_back_door_outlined),
                onTap: () {
                  print("object");
                  Navigator.pop(context);
                },
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                  child: Text(
                    "Verson : 1.01",
                    strutStyle: StrutStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: _buildFragment(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.toggleTheme();
        },
        child: Icon(Icons.lightbulb),
      ),
      bottomNavigationBar: GNav(
        gap: 2,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        haptic: true,
        curve: Curves.easeOutExpo,
        tabs: [
          GButton(
            icon: Icons.home,
            text: 'Home',
            onPressed: () {
              setState(() {
                _currentPage = 'All Notes';
              });
            },
          ),
          GButton(
            icon: Icons.search,
            text: 'Search',
            onPressed: () {
              setState(() {
                _currentPage = 'Search';
              });
            },
          ),
          GButton(
            icon: Icons.favorite,
            text: 'Favorites',
            onPressed: () {
              setState(() {
                _currentPage = 'Favorites';
              });
            },
          ),
          GButton(
              icon: Icons.more,
              text: "More",
              onPressed: () => {
                    setState(() {
                      _currentPage = 'more';
                    })
                  })
        ],
      ),
    );
  }

  Widget _buildFragment() {
    switch (_currentPage) {
      case 'All Notes':
        return HomePageFragment();
      case 'Favorites':
        return FavoritesFragment();
      case 'Settings':
        return SettingsFragment();
      case 'Search':
        return SearchFragment();
      case 'more':
        return MoreFragment();
      default:
        return HomePageFragment();
    }
  }
}
