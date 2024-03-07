// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:Note/pages/moreFragment.dart';
import 'package:Note/pages/seachFragment.dart';
import 'package:flutter/material.dart';
import 'pages/FavoritesFragment.dart';
import 'pages/HomePageFragment.dart';
import 'pages/SettingsFragment.dart';
import 'utility/appbar.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _currentPage = 'All Notes';
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: MyAppBar(
        scaffoldKey: scaffoldKey,
      ),
      drawer: Drawer(
          backgroundColor: const Color.fromRGBO(100, 181, 246, 1),
          child: ListView(children: [
            DrawerHeader(
              child: Text(
                "Header Drawer",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              title: Text("Home"),
              leading: Icon(Icons.home),
              onTap: () {
                setState(() {
                  _currentPage = 'All Notes';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Favorates"),
              leading: Icon(Icons.home),
              onTap: () {
                setState(() {
                  _currentPage = 'Favorites';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Settings"),
              leading: Icon(Icons.home),
              onTap: () {
                setState(() {
                  _currentPage = 'Settings';
                });
                Navigator.pop(context);
              },
            ),
          ])),
      body: _buildFragment(),
      bottomNavigationBar: GNav(
        tabs: [
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
