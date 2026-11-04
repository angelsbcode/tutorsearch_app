import 'package:flutter/material.dart';

import 'catalog_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();

  int currentPage = 0;

  final List<Map<String, String>> slides = [
    {
      'image': 'images/onboarding/inicio.png',
      'title': 'Encuentra tutores para ti',
      'description': 'Descubre compañeros que dominan tus materias y encuentra opciones que se adaptan a tus horarios.',
    },
    {
      'image': 'images/onboarding/buscar.png',
      'title': 'Busca y compara perfiles',
      'description': 'Filtra por materia, horario y modalidad. Encuentra al tutor ideal para aprender.',
    },
    {
      'image': 'images/onboarding/agenda.png',
      'title': 'Organiza tus sesiones',
      'description': 'Elige horarios, envía solicitudes y mantén todas tus tutorías organizadas.',
    },
  ];

  void irAlCatalogo() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const TutorCatalogScreen()),
    );
  }

  void siguiente() {
    if (currentPage < slides.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      irAlCatalogo();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const azul = Color(0xFF3E54AC);

    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FC),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final padding = (constraints.maxWidth * 0.06)
                .clamp(16.0, 32.0)
                .toDouble();

            final imageHeight = (constraints.maxHeight * 0.43)
                .clamp(210.0, 360.0)
                .toDouble();

            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: Padding(
                      padding: EdgeInsets.all(padding),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 42,
                                height: 42,
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: azul,
                                  borderRadius: BorderRadius.circular(13),
                                ),
                                child: Image.asset(
                                  'images/buho.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'TutorUP',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF151D3B),
                                    ),
                                  ),
                                  Text(
                                    'TUTORÍAS ENTRE COMPAÑEROS',
                                    style: TextStyle(
                                      fontSize: 8,
                                      letterSpacing: 0.8,
                                      color: Color(0xFF64748B),
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              TextButton(
                                onPressed: irAlCatalogo,
                                child: const Text(
                                  'Omitir',
                                  style: TextStyle(color: azul),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 20),

                          SizedBox(
                            height: imageHeight,
                            child: PageView.builder(
                              controller: _controller,
                              itemCount: slides.length,
                              onPageChanged: (index) {
                                setState(() {
                                  currentPage = index;
                                });
                              },
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFE9EEF9),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: Center(
                                    child: AspectRatio(
                                      aspectRatio: 706 / 1600,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.asset(
                                          slides[index]['image']!,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),

                          const SizedBox(height: 24),

                          Text(
                            slides[currentPage]['title']!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF151D3B),
                            ),
                          ),

                          const SizedBox(height: 12),

                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 400),
                            child: Text(
                              slides[currentPage]['description']!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 15,
                                height: 1.6,
                                color: Color(0xFF64748B),
                              ),
                            ),
                          ),

                          const SizedBox(height: 24),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(slides.length, (index) {
                              final selected = currentPage == index;

                              return AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                ),
                                width: selected ? 28 : 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: selected
                                      ? azul
                                      : const Color(0xFFCBD5E1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              );
                            }),
                          ),

                          const SizedBox(height: 25),

                          SizedBox(
                            height: 56,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: siguiente,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: azul,
                                foregroundColor: Colors.white,
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    currentPage == 2 ? 'Comenzar' : 'Siguiente',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  const Icon(Icons.arrow_forward_rounded),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
