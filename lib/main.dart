import 'package:flutter/material.dart';
import 'features/splash_screen.dart';
import 'providers/sesion_provider.dart';
import 'core/core_theme.dart';
import 'package:provider/provider.dart';

//import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Huellitas Match',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(), // <--- Aquí aplicas tu tema
      home: const SplashScreen(), // Tu pantalla inicial
    );
  }
}
