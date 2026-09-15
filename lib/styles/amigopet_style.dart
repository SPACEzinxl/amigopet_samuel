import 'package:flutter/material.dart';

class AmigoPetColors {
  static const Color primary = Color(0xFF4CAF50);
  static const Color darkGreen = Color(0xFF1B5E20);
  static const Color lightGreen = Color(0xFFE8F5E9);

  static const Color background = Color(0xFFF7FAF7);
  static const Color white = Color(0xFFFFFFFF);

  static const Color textDark = Color(0xFF26332A);
  static const Color textGrey = Color(0xFF68756C);

  static const Color orange = Color(0xFFFFA726);
  static const Color red = Color(0xFFE53935);
}

class AmigoPetStyles {
  static const TextStyle title = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w800,
    color: AmigoPetColors.textDark,
  );

  static const TextStyle appBarTitle = TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.bold,
    color: AmigoPetColors.white,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 14,
    color: AmigoPetColors.textGrey,
    height: 1.4,
  );

  static const TextStyle cardTitle = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w800,
    color: AmigoPetColors.textDark,
  );

  static const TextStyle sectionTitle = TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.w800,
    color: AmigoPetColors.textDark,
  );
}
