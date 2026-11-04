import 'package:flutter/material.dart';

class AppColors {
  // Color principal (Azul corporativo/educativo del botón y avatares)
  static const Color primario = Color.fromARGB(255, 63, 81, 168);
  static const Color primarioClaro = Colors.white;
  
  // Color de acento (Azul cian suave para detalles o iconos destacados)
  static const Color acento = Color.fromARGB(255, 201, 235, 233);
  
  // Fondo general de la aplicación (Blanco purísimo / gris extremadamente sutil)
  static const Color fondo = Color.fromARGB(255, 248, 249, 253);
  
  // Textos principales y secundarios
  static const Color textoPrincipal = Color.fromARGB(255, 29, 30, 41);
  static const Color textoSecundario = Color.fromARGB(255, 112, 116, 131);
}

class AppSpacing {
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
}

ThemeData buildAppTheme() {
  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.fondo,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primario,
      primary: AppColors.primario,
      secondary: AppColors.acento,
      surface: AppColors.fondo,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.fondo,
      foregroundColor: AppColors.textoPrincipal,
      elevation: 0,
      centerTitle: true,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: AppColors.textoPrincipal,
        fontSize: 28,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.5,
      ),
      headlineSmall: TextStyle(
        color: AppColors.textoPrincipal,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        color: AppColors.textoPrincipal,
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        color: AppColors.textoSecundario,
        fontSize: 14,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primario,
        foregroundColor: AppColors.primarioClaro,
        elevation: 0,
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 24,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );
}