import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';


void main() {
  runApp(const ProviderScope(child: MainApp()) );
}
final ColorScheme lightColorScheme = ColorScheme.fromSeed(seedColor: Colors.red[900]!);
final ColorScheme darkColorScheme = ColorScheme.fromSeed(brightness: Brightness.dark, seedColor: Colors.red[900]!);

final darkTheme = ThemeData(
    colorScheme: darkColorScheme, //
    useMaterial3: true,
    textTheme: GoogleFonts.ubuntuTextTheme()
);

final lightTheme = ThemeData(
    colorScheme: lightColorScheme, //
    useMaterial3: true,
    textTheme: GoogleFonts.ubuntuTextTheme()
);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mi Comida',
      theme: darkTheme,
      home: const TabsScreen(),
    );
  }
}


