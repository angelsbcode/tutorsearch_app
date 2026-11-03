import 'package:flutter/material.dart';
//import 'cart_provider.dart';
import 'package:provider/provider.dart';

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
    required this.descripcion
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nombre),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Imagen con tamaño controlado para que se vea completa
                Hero(
                  tag: 'tutor-$nombre',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      rutaImagen,
                      height: 300, // Altura más compacta
                      width: 250,  // Ancho controlado para que sea cuadrada y no gigante
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Nombre de la tutor
                Text(
                  nombre,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 16),

                // Contenedor con categoría y costoHora en la misma fila
                Container(
                  width: 300, // Ancho moderado para que no ocupe toda la pantalla
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 92, 174, 96).withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color.fromARGB(255, 74, 125, 76).withValues(alpha: 0.2)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.category_outlined, size: 18, color: Colors.green),
                          const SizedBox(width: 6),
                          Text(
                            materia,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        costoHora,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 8, 139, 13),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                    descripcion,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Color.fromARGB(255, 6, 6, 6),
                    ),
                    textAlign: TextAlign.center,
                  ),
                const SizedBox(height: 24),

                // Botones con tamaño normal (no responsivos/anchos)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /*ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        context.read<CartProvider>().agregar();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('$nombre agregada al carrito'),
                          ),
                        );
                      }, 
                      icon: const Icon(Icons.add_shopping_cart, size: 18),
                      label: const Text('Agregar'),
                    ),*/
                    const SizedBox(width: 12),
                    /*OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red.shade700,
                        side: BorderSide(color: Colors.red.shade300),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        context.read<CartProvider>().quitar();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('$nombre eliminada del carrito'),
                          ),
                        );
                      }, 
                      icon: const Icon(Icons.remove_shopping_cart, size: 18),
                      label: const Text('Eliminar'),
                    ),
                    */
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}