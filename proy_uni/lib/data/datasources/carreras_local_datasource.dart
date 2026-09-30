import '../../domain/entities/carrera.dart';

// ============================================================================
// CAPA: Datos (Data) · Fuente de datos local
// ----------------------------------------------------------------------------
// Por ahora la información vive en el propio código (un arreglo fijo).
// El día de mañana podría venir de un archivo JSON o de un servidor sin que
// el resto de la app se entere, porque las pantallas nunca hablan con esta
// clase directamente: solo la usa el repositorio (ver carreras_repository_impl.dart).
// ============================================================================
class CarrerasLocalDataSource {
  List<Carrera> obtenerCarreras() {
    return const [
      Carrera(
        id: 'software',
        nombre: 'Ingeniería en Desarrollo de Software',
        descripcion:
            'Forma profesionales capaces de diseñar, construir y mantener '
            'aplicaciones y sistemas de software de calidad, aplicando '
            'metodologías ágiles y buenas prácticas de programación para '
            'resolver problemas reales con tecnología.',
      ),
      Carrera(
        id: 'redes',
        nombre: 'Ingeniería en Infraestructura de Redes',
        descripcion:
            'Prepara especialistas en el diseño, instalación y '
            'administración de redes de datos, centros de cómputo y '
            'servicios en la nube, garantizando la conectividad, el '
            'rendimiento y la seguridad de la infraestructura tecnológica.',
      ),
      Carrera(
        id: 'ia',
        nombre: 'Ingeniería en Inteligencia Artificial y Ciencia de Datos',
        descripcion:
            'Combina matemáticas, programación y aprendizaje automático '
            'para desarrollar modelos y sistemas inteligentes capaces de '
            'analizar grandes volúmenes de información y apoyar la toma '
            'de decisiones.',
      ),
      Carrera(
        id: 'datos',
        nombre: 'Licenciatura en Ciencia de Datos',
        descripcion:
            'Forma profesionales que recolectan, limpian, analizan y '
            'visualizan datos para convertirlos en información útil, '
            'combinando estadística, programación y conocimiento del '
            'negocio.',
      ),
      Carrera(
        id: 'ciberseguridad',
        nombre: 'Ingeniería en Ciberseguridad',
        descripcion:
            'Prepara especialistas en proteger la información, las redes '
            'y los sistemas de una organización frente a amenazas '
            'digitales, mediante la identificación de vulnerabilidades y '
            'buenas prácticas de seguridad.',
      ),
    ];
  }
}
