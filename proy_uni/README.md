# Universidad TI — versión con arquitectura limpia

Este `.zip` contiene solo la carpeta `lib/` con el código organizado en
capas. Para usarla:

1. Crea el proyecto si aún no existe: `flutter create universidad_ti`
2. Copia la carpeta `lib/` de este `.zip` dentro de tu proyecto,
   **reemplazando** la que Flutter generó automáticamente.
3. Ejecuta `flutter run`.

## Árbol de carpetas

```
lib/
├── main.dart                                  Composición: arma el
│                                               repositorio concreto y
│                                               arranca la app.
│
├── domain/                                    No depende de Flutter UI.
│   ├── entities/
│   │   └── carrera.dart                       Entidad: id, nombre,
│   │                                           descripción.
│   └── repositories/
│       └── carreras_repository.dart           Contrato abstracto:
│                                               "obtenerCarreras()".
│
├── data/                                      Implementa el contrato.
│   ├── datasources/
│   │   └── carreras_local_datasource.dart     Arreglo con las 5 carreras.
│   └── repositories/
│       └── carreras_repository_impl.dart      CarrerasRepositoryImpl.
│
└── presentation/                               Pantallas y widgets.
    ├── theme/
    │   └── estilo_carrera.dart                Ícono y color por carrera.
    ├── widgets/
    │   └── tarjeta_carrera.dart               Tarjeta reutilizable.
    └── screens/
        ├── pantalla_principal.dart            Rejilla (2 columnas).
        └── pantalla_contenido.dart            Detalle de una carrera.
```

## ¿Por qué estas tres capas?

- **`domain/`** contiene las reglas y los datos que le importan al
  negocio (qué es una carrera, qué se puede hacer con ellas). No sabe
  nada de `Icon`, `Color` ni de dónde vienen los datos.
- **`data/`** decide **de dónde** salen los datos reales (hoy, un
  arreglo fijo; mañana, un archivo o un servidor) y cumple el contrato
  que pidió el dominio.
- **`presentation/`** dibuja la interfaz. Solo conoce el **contrato**
  del dominio (`CarrerasRepository`), nunca la implementación concreta.

Esa regla —la presentación depende de una abstracción, no de una
implementación— se llama **inversión de dependencias** y es el corazón
de la arquitectura limpia. `main.dart` es el único archivo que conoce
tanto el contrato como su implementación concreta, y es quien los une.

## Ventaja práctica

Si mañana los datos de las carreras vinieran de un archivo JSON o de un
servidor, solo se crearía una nueva clase en `data/` (por ejemplo
`CarrerasApiDataSource`) y se cambiaría **una línea** en `main.dart`.
Ninguna pantalla de `presentation/` tendría que modificarse.
