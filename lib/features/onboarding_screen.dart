import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'catalog_screen.dart'; // Asegúrate de que apunte a tu catálogo

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      'title': 'Encuentra un tutor',
      'subtitle': 'Busca compañeros que ya dominan la materia que te cuesta y compara sus perfiles.',
      'type': 'step1',
    },
    {
      'title': 'Explora el catálogo',
      'subtitle': 'Visualiza profesores organizados por categorías y encuentra tutores disponibles esta semana.',
      'type': 'step2',
    },
    {
      'title': 'Conoce la ficha del tutor',
      'subtitle': 'Revisa costos por hora, calificaciones, materias y descripciones antes de agendar.',
      'type': 'step3',
    },
  ];

  void _navigateToCatalog() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const TutorCatalogScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            children: [
              // Botón Omitir
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: _navigateToCatalog,
                  child: const Text(
                    'Omitir',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              const Spacer(),

              // Carrusel de pantallas demostrativas (PageView)
              SizedBox(
                height: 260,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _onboardingData.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return _buildStepIllustration(index);
                  },
                ),
              ),

              const Spacer(),

              // Títulos dinámicos
              Text(
                _onboardingData[_currentIndex]['title']!,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                _onboardingData[_currentIndex]['subtitle']!,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black54, height: 1.4),
              ),
              const SizedBox(height: 24),

              // Indicadores de puntos (Dots)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _onboardingData.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    width: _currentIndex == index ? 24 : 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: _currentIndex == index
                          ? const Color(0xFF3F51B5)
                          : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Botón Siguiente / Comenzar
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3F51B5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    if (_currentIndex < _onboardingData.length - 1) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      _navigateToCatalog();
                    }
                  },
                  child: Text(
                    _currentIndex == _onboardingData.length - 1
                        ? 'Comenzar'
                        : 'Siguiente',
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Ilustraciones demostrativas para cada paso
  Widget _buildStepIllustration(int index) {
    if (index == 0) {
      return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFFF0F3FA),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: const ListTile(
                leading: CircleAvatar(
                  backgroundColor: Color(0xFF3F51B5),
                  child: Text('MR', style: TextStyle(color: Colors.white)),
                ),
                title: Text(
                  'Mariana Ruiz',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                subtitle: Text(
                  'Cálculo Diferencial',
                  style: TextStyle(fontSize: 12),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    Text(
                      ' 4.9',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    } else if (index == 1) {
      return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFFF0F3FA),
          borderRadius: BorderRadius.circular(24),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.grid_view_rounded, size: 64, color: Color(0xFF3F51B5)),
            SizedBox(height: 12),
            Text(
              'Catálogo de Profesores',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 4),
            Text(
              'Filtra materias y encuentra opciones rápido.',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFFF0F3FA),
          borderRadius: BorderRadius.circular(24),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Color(0xFF3F51B5),
              child: Icon(Icons.person, size: 36, color: Colors.white),
            ),
            SizedBox(height: 12),
            Text(
              'Ficha Detallada del Tutor',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 4),
            Text(
              'Consulta costos, descripción y horarios.',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      );
    }
  }
}
