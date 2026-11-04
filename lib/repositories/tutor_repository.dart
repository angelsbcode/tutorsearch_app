import '../models/tutor_model.dart';

class TutorRepository {
  // Declaramos e inicializamos tutorDemo aquí mismo
  final List<Tutor> tutorDemo = [
    const Tutor(
      id: '1',
      nombre: 'Mariana Ruiz',
      costo: 250.0,
      rutaImagen:
          'images/mariana.png', // Ajusta según tu asset o URLimages\mariana.png
      materia: 'Cálculo Diferencial',
      descripcion: 'Tutora especializada en cálculo y matemáticas avanzados.',
    ),
    const Tutor(
      id: '2',
      nombre: 'Alejandro Pérez',
      costo: 200.0,
      rutaImagen: 'images/alejandro.png',
      materia: 'Física I',
      descripcion: 'Clases prácticas enfocadas en resolución de problemas.',
    ),
  ];

  List<Tutor> obtenerTutor() {
    return List.unmodifiable(_tutores);
  }
}
