import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/descuento_viewmodel.dart';
import '../tema/colores_app.dart';

import '../../viewmodels/descuento_viewmodel.dart';
import '../tema/colores_app.dart';

class InicioPantalla extends StatelessWidget {
  const InicioPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'AHORRO EN CAJA',
                style: TextStyle(
                  color: ColoresApp.turquesa,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 24),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: ColoresApp.tinta,
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 58,
                      height: 58,
                      decoration: BoxDecoration(
                        color: ColoresApp.coral,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Icon(
                        Icons.local_offer_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'CASO 03  ·  TIENDA',
                      style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.3,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Tu compra,\ncon cuentas claras',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        height: 1.15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 14),
                    const Text(
                      'Calcula el descuento y descubre cuánto pagarás.',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              const Text(
                'El descuento depende del monto de compra. '
                    'Si eres cliente frecuente, recibes un 5% adicional.',
                style: TextStyle(
                  color: ColoresApp.tinta,
                  fontSize: 16,
                  height: 1.45,
                ),
              ),
              const SizedBox(height: 28),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton.icon(
                  onPressed: () {
                    context.read<DescuentoViewModel>().reiniciar();
                    Navigator.pushNamed(context, '/descuento');
                  },
                  icon: const Icon(Icons.arrow_forward_rounded),
                  label: const Text('Calcular mi compra'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColoresApp.turquesa,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}