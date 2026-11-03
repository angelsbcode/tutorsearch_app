import 'package:flutter/material.dart';
//import 'core_theme.dart';

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
    return Scaffold(
    body: InkWell(
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
                offset: const Offset(8, 2)
              )
            ]
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(aspectRatio: 1,
                  child: Image.asset(rutaImagen, fit: BoxFit.cover),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(nombre,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            //color: AppColors.textoPrincipal,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(),
                  Text(costoHora.toString(),
                  style: TextStyle(
                    //color: AppColors.primario,
                    fontWeight: FontWeight.bold,
                  ),  
                  ),
                ]
              )
        ,)
    ),
    );
  }
}

