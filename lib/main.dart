import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinterest_clone/views/screens/home_tab.dart';

void main() {
  runApp(const MyApp());
}

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.red.shade800,
    brightness: Brightness.dark,
  ),
  useMaterial3: true,
  textTheme: GoogleFonts.latoTextTheme(),
  appBarTheme: AppBarTheme(
    centerTitle: true,
    titleTextStyle: GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.grey.shade600,
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pinterest',
      theme: theme,
      home: const HomeTab(),
    );
  }
}
