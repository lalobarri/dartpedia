import 'package:flutter/material.dart';
import '../../domain/entities/carrera.dart';
import '../../domain/repositories/carreras_repository.dart';
import '../widgets/tarjeta_carrera.dart';
import 'pantalla_contenido.dart';

// ============================================================================
// CAPA: Presentación (Presentation) · Pantalla 1 (Principal)
// ----------------------------------------------------------------------------
// Depende solo de la ABSTRACCIÓN del dominio (CarrerasRepository), nunca de
// una implementación concreta como CarrerasRepositoryImpl. Quién decide qué
// implementación usar es responsabilidad de main.dart (ver más abajo en el
// árbol de carpetas). Esto es el principio de inversión de dependencias.
// ============================================================================
class PantallaPrincipal extends StatelessWidget {
  final CarrerasRepository repositorio;

  const PantallaPrincipal({super.key, required this.repositorio});

  @override
  Widget build(BuildContext context) {
    // Se piden los datos UNA vez; el arreglo resultante alimenta la rejilla.
    final List<Carrera> carreras = repositorio.obtenerCarreras();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Universidad TI'),
        centerTitle: true,
      ),
      // GridView.builder arma la rejilla recorriendo el arreglo "carreras".
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: carreras.length, // tantas tarjetas como carreras haya
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // <-- dos columnas
          mainAxisSpacing: 14,
          crossAxisSpacing: 14,
          childAspectRatio: 0.85,
        ),
        itemBuilder: (BuildContext context, int indice) {
          final Carrera carrera = carreras[indice];
          return TarjetaCarrera(
            carrera: carrera,
            onTap: () {
              // Navigator.push abre la pantalla de contenido "encima" de
              // esta y le entrega la carrera que corresponde a esa tarjeta.
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext contexto) =>
                      PantallaContenido(carrera: carrera),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
