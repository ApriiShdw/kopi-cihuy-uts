import 'package:flutter/material.dart';
import 'pages/katalog_page.dart';

void main() {
  runApp(const KopiCihuyApp());
}

class KopiCihuyApp extends StatelessWidget {
  const KopiCihuyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kopi Cihuy',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF795548),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFFFF8F0),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF5D4037),
          foregroundColor: Colors.white,
          centerTitle: false,
        ),
      ),
      home: const KatalogPage(),
    );
  }
}