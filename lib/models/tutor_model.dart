class Tutor{
  final String nombre;
  final double costo;
  final String rutaImagen;
  final String materia;
  final String descripcion;
  final String id;

  const Tutor({
    required this.id,
    required this.nombre,
    required this.costo,
    required this.rutaImagen,
    required this.materia,
    required this.descripcion,
  });

  String get costoTexto => '\$${costo.toStringAsFixed(0)}';
  factory Tutor.fromMap(String id, Map<String, dynamic> data) {
    return Tutor(
      id: id,
      nombre: data['nombre'] as String? ?? 'Sin nombre',
      costo: (data['costo'] as num?)?.toDouble() ?? 0,
      rutaImagen: data['rutaImagen'] as String? ?? 'Sin imagen',
      materia: data['materia'] as String? ?? 'Sin categoría',
      descripcion: data['descripcion'] as String? ?? 'Sin descripción',
    );
  }
}