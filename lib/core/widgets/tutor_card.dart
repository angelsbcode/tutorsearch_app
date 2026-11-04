import 'package:flutter/material.dart';

class TutorCard extends StatelessWidget {
  final String nombre;
  final double costoHora;
  final String materia;
  final String rutaImagen;
  final VoidCallback onTap;

  const TutorCard({
    super.key,
    required this.nombre,
    required this.costoHora,
    required this.materia,
    required this.rutaImagen,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            )
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen del tutor
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Image.asset(
                  rutaImagen,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey.shade200,
                    child: const Icon(Icons.person, size: 40, color: Colors.grey),
                  ),
                ),
              ),
            ),
            // Información del tutor
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nombre,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Color(0xFF1D1E29),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    materia,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xFF707483),
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '\$${costoHora.toStringAsFixed(0)} / hr',
                    style: const TextStyle(
                      color: Color(0xFF3F51B5),
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}