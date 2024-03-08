import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeClass {
  // Consistent and well-named color constants
  static const Color lightPrimary = Colors.blue;
  static const Color lightPrimaryVariant = Color.fromARGB(255, 85, 107, 130);
  static const Color lightAccent = Color.fromARGB(255, 147, 193, 228);
  static const Color lightBackground = Colors.white;
  static const Color lightSurface = Colors.white;

  static const Color darkPrimary = Color.fromARGB(255, 0, 3, 5);
  static const Color darkPrimaryVariant = Color.fromARGB(255, 20, 25, 30);
  static const Color darkAccent = Color.fromARGB(255, 25, 29, 32);
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E1E1E);

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: lightBackground,
    appBarTheme: const AppBarTheme(
      color: lightPrimary,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20.0),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: lightPrimary,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
    ),
    colorScheme: const ColorScheme.light(
      primary: lightPrimary,
      secondary: lightAccent,
      background: lightBackground,
      surface: lightSurface,
      onBackground: Color.fromARGB(255, 241, 238, 238),
      onSurface: Colors.black,
    ),
    tabBarTheme: TabBarTheme(
      indicatorColor: Colors.black,
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey,
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(
          fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black),
      headline6: TextStyle(
          fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
      bodyText1: TextStyle(fontSize: 16.0, color: Colors.black),
      bodyText2: TextStyle(fontSize: 14.0, color: Colors.black),
    ),
    cardTheme: CardTheme(
      elevation: 4,
      shadowColor: lightBackground.withOpacity(0.5),
      color: lightBackground,
    ),
    dividerColor: Colors.grey.shade400,
    errorColor: Colors.red,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: darkPrimary,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      backgroundColor: lightPrimary,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: lightPrimary,
    )
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: darkBackground,
    appBarTheme: const AppBarTheme(
      color: darkPrimary,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20.0),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: darkPrimary,
        statusBarIconBrightness: Brightness.light,
        // For Android (dark icons)
        statusBarBrightness: Brightness.dark,
      ),
    ),
    tabBarTheme: TabBarTheme(
      indicatorColor: Colors.white,
      labelColor: Colors.white,
      unselectedLabelColor: Colors.grey,
    ),
    cardTheme: CardTheme(
      color: darkBackground,
    ),
    colorScheme: const ColorScheme.dark(
      primary: darkPrimary,
      secondary: darkAccent,
      background: darkBackground,
      surface: darkSurface,
      onBackground: Colors.white,
      onSurface: Colors.white,
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(
          fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
      headline6: TextStyle(
          fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
      bodyText1: TextStyle(fontSize: 16.0, color: Colors.white),
      bodyText2: TextStyle(fontSize: 14.0, color: Colors.white),
    ),
    dividerColor: Colors.grey.shade800,
    errorColor: Colors.redAccent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: lightPrimary,
      unselectedItemColor: const Color.fromARGB(255, 15, 0, 0),
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      backgroundColor: Colors.white,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.white,
    )
  );
}
