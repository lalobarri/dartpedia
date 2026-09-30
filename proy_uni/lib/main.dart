// ============================================================================
// Práctica 3: Universidad TI (versión con arquitectura limpia)
// Archivo: lib/main.dart
//
// Capas:
//   domain/         -> entidades y contratos (no dependen de Flutter UI)
//   data/            -> implementación del contrato (fuente de datos local)
//   presentation/    -> pantallas y widgets (usan el dominio, no los datos)
//
// main.dart es la "composición": el único lugar donde se decide qué
// implementación concreta (CarrerasRepositoryImpl) usará la app.
// ============================================================================
import 'package:flutter/material.dart';

import 'data/datasources/carreras_local_datasource.dart';
import 'data/repositories/carreras_repository_impl.dart';
import 'domain/repositories/carreras_repository.dart';
import 'presentation/screens/pantalla_principal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Se arma la implementación concreta UNA sola vez, aquí.
    // PantallaPrincipal solo conoce el tipo abstracto CarrerasRepository.
    final CarrerasRepository repositorio = CarrerasRepositoryImpl(
      CarrerasLocalDataSource(),
    );

    return MaterialApp(
      title: 'Universidad TI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0D47A1)),
        useMaterial3: true,
      ),
      home: PantallaPrincipal(repositorio: repositorio),
    );
  }
}
