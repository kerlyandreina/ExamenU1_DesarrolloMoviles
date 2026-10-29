import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../modelos/descuento_modelo.dart';
import '../../viewmodels/descuento_viewmodel.dart';
import '../tema/colores_app.dart';
import '../widgets/campo_numero.dart';
import '../widgets/selector_cliente.dart';

class DescuentoPantalla extends StatefulWidget {
  const DescuentoPantalla({super.key});

  @override
  State<DescuentoPantalla> createState() => _DescuentoPantallaState();
}

class _DescuentoPantallaState extends State<DescuentoPantalla> {
  final montoController = TextEditingController();

  @override
  void dispose() {
    montoController.dispose();
    super.dispose();
  }

  void calcular() {
    final texto = montoController.text.trim().replaceAll(',', '.');
    final monto = double.tryParse(texto);

    if (monto == null || !monto.isFinite || monto < 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Ingresa un monto válido, igual o mayor a 0.'),
        ),
      );
      return;
    }

    final resultado = context.read<DescuentoViewModel>().calcular(monto);

    Navigator.pushNamed(
      context,
      '/resultado',
      arguments: resultado,
    );
  }

  Widget regla(String monto, String porcentaje) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(monto),
          Text(
            porcentaje,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final esFrecuente =
        context.watch<DescuentoViewModel>().esClienteFrecuente;

    return Scaffold(
      appBar: AppBar(title: const Text('Descuento en tienda')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'PASO 02  ·  TU COMPRA',
              style: TextStyle(
                color: ColoresApp.turquesa,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '¿Cuál es el monto?',
              style: TextStyle(
                color: ColoresApp.tinta,
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 18),
            Card(
              color: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
                side: const BorderSide(color: Color(0xFFE5DED0)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CampoNumero(
                      etiqueta: 'Valor de la compra',
                      controller: montoController,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Tipo de cliente',
                      style: TextStyle(
                        color: ColoresApp.tinta,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SelectorCliente(
                      esClienteFrecuente: esFrecuente,
                      onSeleccionar: (frecuente) {
                        context
                            .read<DescuentoViewModel>()
                            .seleccionarClienteFrecuente(frecuente);
                      },
                    ),
                    if (esFrecuente) ...[
                      const SizedBox(height: 12),
                      const Text(
                        'Se sumará un 5% al descuento por monto.',
                        style: TextStyle(color: ColoresApp.turquesa),
                      ),
                    ],
                  ],
                ),
              ),
            ),
            const SizedBox(height: 18),
            Card(
              color: ColoresApp.menta,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Descuento por monto',
                      style: TextStyle(
                        color: ColoresApp.tinta,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    regla('Menos de \$100', '0%'),
                    regla('\$100 a menos de \$300', '5%'),
                    regla('\$300 a menos de \$500', '10%'),
                    regla('\$500 o más', '15%'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 22),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton.icon(
                onPressed: calcular,
                icon: const Icon(Icons.receipt_long_rounded),
                label: const Text('Calcular descuento'),
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
    );
  }
}