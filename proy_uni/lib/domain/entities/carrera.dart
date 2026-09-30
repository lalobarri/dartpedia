// ============================================================================
// CAPA: Dominio (Domain) · Entidad
// ----------------------------------------------------------------------------
// Representa una carrera con los datos que tienen sentido de negocio.
// A propósito NO sabe nada de Flutter, widgets, íconos ni colores: eso es
// responsabilidad de la capa de presentación. Así, el dominio se puede
// entender (y probar) sin depender de la interfaz gráfica.
// ============================================================================
class Carrera {
  final String id;
  final String nombre;
  final String descripcion;

  const Carrera({
    required this.id,
    required this.nombre,
    required this.descripcion,
  });
}
