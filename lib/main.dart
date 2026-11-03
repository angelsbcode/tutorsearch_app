import 'package:flutter/material.dart';
import 'features/splash_screen.dart';
import 'providers/sesion_provider.dart';
//import 'package:vibero/core_theme.dart';
import 'package:provider/provider.dart';

//import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (context) => null,//CartProvider(),
      child: const ViveroApp(),
    ),
  );
}

class ViveroApp extends StatelessWidget{
  const ViveroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vivero+', 
      debugShowCheckedModeBanner: false,
      theme: null, //buildAppTheme(),
      home: null, //const SplashScreen(),
    );
  }
}

