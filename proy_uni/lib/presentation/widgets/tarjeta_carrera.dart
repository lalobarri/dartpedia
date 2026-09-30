import 'package:flutter/material.dart';
import '../../domain/entities/carrera.dart';
import '../theme/estilo_carrera.dart';

// ============================================================================
// CAPA: Presentación (Presentation) · Widget reutilizable
// ----------------------------------------------------------------------------
// Una sola definición de tarjeta sirve para cualquier carrera que exista en
// el arreglo, sin importar cuántas sean. Recibe la Carrera a mostrar y una
// función "onTap": no decide ella misma qué pasa al tocarla, solo avisa.
// ============================================================================
class TarjetaCarrera extends StatelessWidget {
  final Carrera carrera;
  final VoidCallback onTap;

  const TarjetaCarrera({
    super.key,
    required this.carrera,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color color = EstiloCarrera.colorPara(carrera.id);
    final IconData icono = EstiloCarrera.iconoPara(carrera.id);

    return Card(
      clipBehavior: Clip.antiAlias, // recorta el InkWell a las esquinas
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // "Imagen representativa": un ícono dentro de un círculo de
              // color. No necesita archivos ni conexión a internet.
              CircleAvatar(
                radius: 30,
                backgroundColor: color,
                child: Icon(icono, color: Colors.white, size: 30),
              ),
              const SizedBox(height: 12),
              Text(
                carrera.nombre,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
