import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'viewmodels/descuento_viewmodel.dart';
import 'vista/pantallas/descuento_pantalla.dart';
import 'vista/pantallas/inicio_pantalla.dart';
import 'vista/pantallas/resultado_pantalla.dart';
import 'vista/tema/colores_app.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => DescuentoViewModel(),
      child: const MiApp(),
    ),
  );
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ahorro en caja',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: ColoresApp.turquesa,
        ).copyWith(
          tertiary: ColoresApp.coral,
        ),
        scaffoldBackgroundColor: ColoresApp.marfil,
        appBarTheme: const AppBarTheme(
          backgroundColor: ColoresApp.marfil,
          foregroundColor: ColoresApp.tinta,
        ),
      ),
      initialRoute: '/inicio',
      routes: {
        '/inicio': (context) => const InicioPantalla(),
        '/descuento': (context) => const DescuentoPantalla(),
        '/resultado': (context) => const ResultadoPantalla(),
      },
    );
  }
}