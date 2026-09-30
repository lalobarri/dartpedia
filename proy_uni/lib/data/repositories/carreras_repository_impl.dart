import '../../domain/entities/carrera.dart';
import '../../domain/repositories/carreras_repository.dart';
import '../datasources/carreras_local_datasource.dart';

// ============================================================================
// CAPA: Datos (Data) · Implementación del repositorio
// ----------------------------------------------------------------------------
// Cumple el contrato definido en el dominio (implements CarrerasRepository)
// traduciendo "obtener carreras" a "pedirlas a la fuente de datos local".
// Si mañana cambias el origen de los datos, solo se edita esta clase (o se
// agrega otra implementación); las pantallas no cambian ni una línea.
// ============================================================================
class CarrerasRepositoryImpl implements CarrerasRepository {
  final CarrerasLocalDataSource fuenteDeDatos;

  const CarrerasRepositoryImpl(this.fuenteDeDatos);

  @override
  List<Carrera> obtenerCarreras() => fuenteDeDatos.obtenerCarreras();
}
