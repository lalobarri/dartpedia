import 'package:flutter/material.dart';
import '../../domain/entities/carrera.dart';
import '../theme/estilo_carrera.dart';

// ============================================================================
// CAPA: Presentación (Presentation) · Pantalla 2 (Contenido)
// ----------------------------------------------------------------------------
// Solo depende de la entidad Carrera (dominio) y de EstiloCarrera
// (presentación) para saber cómo dibujarse. No conoce el repositorio ni
// de dónde salió la carrera: solo la recibe ya lista por su constructor.
// ============================================================================
class PantallaContenido extends StatelessWidget {
  final Carrera carrera;

  const PantallaContenido({super.key, required this.carrera});

  @override
  Widget build(BuildContext context) {
    final Color color = EstiloCarrera.colorPara(carrera.id);
    final IconData icono = EstiloCarrera.iconoPara(carrera.id);

    return Scaffold(
      // El AppBar agrega solo la flecha de regreso, porque esta pantalla
      // se abrió con Navigator.push. Tocarla equivale a Navigator.pop.
      appBar: AppBar(title: const Text('Contenido')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 12),
            // Misma imagen representativa que la tarjeta de origen.
            CircleAvatar(
              radius: 60,
              backgroundColor: color,
              child: Icon(icono, color: Colors.white, size: 60),
            ),
            const SizedBox(height: 20),
            Text(
              carrera.nombre,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              carrera.descripcion,
              style: const TextStyle(fontSize: 15, height: 1.4),
            ),
            // Spacer empuja el botón hacia la parte inferior de la pantalla.
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                // pop() cierra esta pantalla y regresa a la anterior.
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Regresar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
