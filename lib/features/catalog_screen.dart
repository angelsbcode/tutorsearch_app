import 'package:flutter/material.dart';
import '../core/widgets/tutor_card.dart';
import 'detalle_tutor_screen.dart';
import '../models/tutor_model.dart';
import '../repositories/tutor_repository.dart';

class TutorCatalogScreen extends StatefulWidget {
  const TutorCatalogScreen({super.key});

  @override
  State<TutorCatalogScreen> createState() => _tutorCatalogScreenState();
}

class _tutorCatalogScreenState extends State<TutorCatalogScreen> {
  final TutorRepository _repository = TutorRepository();
  String materiaSeleccionada = 'Todas';
  String textoBusqueda = '';

  List<Tutor> get TutorFiltradas {
    return _repository.obtenerTutor().where((tutor) {
      final coincidenciamateria = materiaSeleccionada == 'Todas' || tutor.materia == materiaSeleccionada;
      final coincidenciaBusqueda = tutor.nombre.toLowerCase().contains(textoBusqueda.toLowerCase());
      return coincidenciamateria && coincidenciaBusqueda;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    const materias = ['Todas', 'Interior', 'Exterior'];
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de tutor'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          // Barra de búsqueda
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Buscar tutor',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  textoBusqueda = value;
                });
              },
            ),
          ),
          
          // Lista horizontal de categorías
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: materias.map((materia) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ChoiceChip(
                    label: Text(materia),
                    selected: materiaSeleccionada == materia,
                    selectedColor: Colors.green.shade100,
                    labelStyle: TextStyle(
                      color: materiaSeleccionada == materia ? Colors.green.shade800 : Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                    onSelected: (bool selected) {
                      setState(() {
                        materiaSeleccionada = materia;
                      });
                    },
                  ),
                );
              }).toList(),
            ),
          ),
          
          const SizedBox(height: 10),

          // Cuadrícula (Grid) para mostrar las tutoras filtradas
          Expanded(
            child: TutorFiltradas.isEmpty
            ? const Center(
                child: Text('No se encontraron tutores', style: TextStyle(color: Colors.grey, fontSize: 16)),
              )
            : GridView.builder(
                padding: const EdgeInsets.all(16.0),
                // Añadido 'const' para corregir el warning de linter
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 columnas
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.75, // Proporción de las tarjetas
                ),
                itemCount: TutorFiltradas.length,
                itemBuilder: (context, index) {
                  final tutor = TutorFiltradas[index];
                  return Hero(
                    tag: 'tutor-${tutor.nombre}', // Tag único para la animación Hero
                    child: TutorCard( 
                      nombre: tutor.nombre,
                      costoHora: tutor.costo,
                      materia: tutor.materia,
                      rutaImagen: tutor.rutaImagen,
                      onTap: () {
                        // Navegar a los detalles
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TutorDetailsScreen(
                              nombre: tutor.nombre,
                              rutaImagen: tutor.rutaImagen,
                              materia: tutor.materia,
                              costoHora: tutor.costoTexto,
                              descripcion: tutor.materia,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
          ),
        ],
      ),
    );
  }
}