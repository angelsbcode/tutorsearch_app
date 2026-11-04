import 'package:flutter/material.dart';

import '../core/core_theme.dart';
import '../core/widgets/tutor_card.dart';
import 'detalle_tutor_screen.dart';
import '../models/tutor_model.dart';
import '../repositories/tutor_repository.dart';

class TutorCatalogScreen extends StatefulWidget {
  const TutorCatalogScreen({super.key});

  @override
  State<TutorCatalogScreen> createState() => _TutorCatalogScreenState();
}

class _TutorCatalogScreenState extends State<TutorCatalogScreen> {
  final TutorRepository _repository = TutorRepository();

  String materiaSeleccionada = 'Todas';
  String textoBusqueda = '';

  List<Tutor> get tutoresFiltrados {
    return _repository.obtenerTutor().where((tutor) {
      final coincidenciaMateria =
          materiaSeleccionada == 'Todas' ||
          tutor.materia == materiaSeleccionada;

      final coincidenciaBusqueda = tutor.nombre.toLowerCase().contains(
        textoBusqueda.toLowerCase(),
      );

      return coincidenciaMateria && coincidenciaBusqueda;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    // Obtenemos dinámicamente las materias únicas directamente del repositorio
    final List<String> materias = [
      'Todas',
      ..._repository.obtenerTutor().map((t) => t.materia).toSet(),
    ];

    return Scaffold(
      backgroundColor: AppColors.fondo,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Superior con el color primario y diseño estilizado
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
              top: 50,
              left: 24,
              right: 24,
              bottom: 24,
            ),
            decoration: const BoxDecoration(
              color: AppColors.primario,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(28),
                bottomRight: Radius.circular(28),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'TutorUP',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.white24,
                      child: Icon(Icons.school, color: Colors.white, size: 20),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'Catálogo de Tutores',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Encuentra el apoyo académico que necesitas',
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Barra de búsqueda normalizada al tema
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Buscar tutor por nombre...',
                      hintStyle: const TextStyle(
                        color: AppColors.textoSecundario,
                        fontSize: 14,
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: AppColors.primario,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 14,
                        horizontal: 16,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: AppColors.primario,
                          width: 1.5,
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        textoBusqueda = value;
                      });
                    },
                  ),

                  const SizedBox(height: 16),

                  // Sección de filtros responsivos con Wrap (pasan a la siguiente línea si no caben)
                  const Text(
                    'Filtrar por materia',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textoPrincipal,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: materias.map((materia) {
                      final isSelected = materiaSeleccionada == materia;
                      return ChoiceChip(
                        label: Text(materia),
                        selected: isSelected,
                        selectedColor: AppColors.primario,
                        backgroundColor: Colors.white,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(
                            color: isSelected
                                ? AppColors.primario
                                : Colors.grey.shade300,
                            width: isSelected ? 1.5 : 1,
                          ),
                        ),
                        labelStyle: TextStyle(
                          color: isSelected
                              ? Colors.white
                              : AppColors.textoPrincipal,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                        onSelected: (bool selected) {
                          setState(() {
                            materiaSeleccionada = materia;
                          });
                        },
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 20),

                  // Cuadrícula (Grid) de tutores filtrados
                  TutorFiltradas.isEmpty
                      ? Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 40.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.search_off_rounded,
                                  size: 56,
                                  color: AppColors.textoSecundario,
                                ),
                                SizedBox(height: 12),
                                Text(
                                  'No se encontraron tutores',
                                  style: TextStyle(
                                    color: AppColors.textoSecundario,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Intenta buscar con otro término o categoría.',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, // 2 columnas
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,
                                childAspectRatio:
                                    0.72, // Proporción de las tarjetas
                              ),
                          itemCount: TutorFiltradas.length,
                          itemBuilder: (context, index) {
                            final tutor = TutorFiltradas[index];
                            return Hero(
                              tag: 'tutor-${tutor.id}',
                              child: TutorCard(
                                nombre: tutor.nombre,
                                costoHora: tutor.costo,
                                materia: tutor.materia,
                                rutaImagen: tutor.rutaImagen,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => TutorDetailsScreen(
                                        nombre: tutor.nombre,
                                        rutaImagen: tutor.rutaImagen,
                                        materia: tutor.materia,
                                        costoHora: tutor.costoTexto,
                                        descripcion: tutor.descripcion,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
