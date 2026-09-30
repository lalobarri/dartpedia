import '../entities/carrera.dart';

// ============================================================================
// CAPA: Dominio (Domain) · Contrato del repositorio
// ----------------------------------------------------------------------------
// Define QUÉ se puede hacer con las carreras (obtenerlas), sin decir CÓMO
// se consiguen. La capa de datos implementará este contrato; la capa de
// presentación solo conocerá esta interfaz, nunca la implementación real.
// Esto es lo que permite cambiar el origen de los datos (de una lista fija
// a un archivo o a internet) sin tocar ni una sola pantalla.
// ============================================================================
abstract class CarrerasRepository {
  List<Carrera> obtenerCarreras();
}
