import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/screens/categories_screen.dart';


void main() {
  runApp(const MyApp());
}

final theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(brightness: Brightness.dark, seedColor: Colors.red[900]!),
    useMaterial3: true,
    textTheme: GoogleFonts.ubuntuTextTheme()
);


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mi Comida',
      theme: theme,
      home: const CategoriesScreen(),
    );
  }
}


