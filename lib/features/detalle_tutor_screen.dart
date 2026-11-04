import 'package:flutter/material.dart';
import '../core/core_theme.dart';

class TutorDetailsScreen extends StatelessWidget {
  final String nombre;
  final String rutaImagen;
  final String materia;
  final String costoHora;
  final String descripcion;

  const TutorDetailsScreen({
    super.key,
    required this.nombre,
    required this.rutaImagen,
    required this.materia,
    required this.costoHora,
    required this.descripcion,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fondo,
      appBar: AppBar(
        title: Text(nombre),
        backgroundColor: AppColors.fondo,
        foregroundColor: AppColors.textoPrincipal,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Imagen del tutor con animación Hero y bordes redondeados del tema
              Hero(
                tag: 'tutor-$nombre',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    rutaImagen,
                    height: 280,
                    width: 280,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 280,
                      width: 280,
                      color: Colors.grey.shade200,
                      child: const Icon(Icons.person, size: 80, color: AppColors.textoSecundario),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Nombre del tutor
              Text(
                nombre,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontSize: 26,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),

              // Contenedor con categoría y costo por hora adaptado a AppColors
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.03),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.category_outlined, size: 20, color: AppColors.primario),
                        const SizedBox(width: 8),
                        Text(
                          materia,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textoPrincipal,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      costoHora,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primario,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Descripción
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Acerca del tutor',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textoPrincipal,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      descripcion,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.textoSecundario,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Botón de acción principal (ej. Agendar o Contactar)
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Solicitud enviada a $nombre'),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  },
                  child: const Text('Agendar tutoría'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}