import 'package:flutter/material.dart';
import 'pages/cuidadores_page.dart';
import 'styles/amigopet_style.dart';

void main() {
  runApp(const AmigoPetApp());
}

class AmigoPetApp extends StatelessWidget {
  const AmigoPetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AmigoPet',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,

        scaffoldBackgroundColor:
        AmigoPetColors.background,

        colorScheme: ColorScheme.fromSeed(
          seedColor: AmigoPetColors.primary,
          primary: AmigoPetColors.primary,
          surface: AmigoPetColors.white,
          brightness: Brightness.light,
        ),

        fontFamily: 'Roboto',

        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: false,
        ),
      ),

      home: const CuidadoresPage(),
    );
  }
}
