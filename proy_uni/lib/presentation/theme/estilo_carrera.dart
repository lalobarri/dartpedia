import 'package:flutter/material.dart';

// ============================================================================
// CAPA: Presentación (Presentation) · Estilo visual
// ----------------------------------------------------------------------------
// El dominio no sabe qué ícono o color representa a cada carrera (eso no es
// un dato de negocio, es una decisión de interfaz). Por eso esa decisión
// vive aquí, en la capa de presentación, y se elige a partir del "id" de
// la entidad Carrera.
// ============================================================================
class EstiloCarrera {
  static IconData iconoPara(String id) {
    switch (id) {
      case 'software':
        return Icons.code;
      case 'redes':
        return Icons.hub;
      case 'ia':
        return Icons.memory;
      case 'datos':
        return Icons.bar_chart;
      case 'ciberseguridad':
        return Icons.shield;
      default:
        return Icons.school;
    }
  }

  static Color colorPara(String id) {
    switch (id) {
      case 'software':
        return const Color(0xFF3F51B5);
      case 'redes':
        return const Color(0xFF00897B);
      case 'ia':
        return const Color(0xFF5E35B1);
      case 'datos':
        return const Color(0xFF1E88E5);
      case 'ciberseguridad':
        return const Color(0xFF37474F);
      default:
        return Colors.blueGrey;
    }
  }
}
