import 'package:flutter/material.dart';

import '../../modelos/descuento_modelo.dart';
import '../tema/colores_app.dart';

class ResultadoPantalla extends StatelessWidget {
  const ResultadoPantalla({super.key});

  String moneda(double valor) => '\$${valor.toStringAsFixed(2)}';

  String porcentaje(double valor) =>
      '${(valor * 100).toStringAsFixed(0)}%';

  Widget fila(String etiqueta, String valor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(etiqueta)),
          const SizedBox(width: 12),
          Text(
            valor,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final resultado =
    ModalRoute.of(context)!.settings.arguments as DescuentoModelo;

    return Scaffold(
      appBar: AppBar(title: const Text('Tu resultado')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: ColoresApp.tinta,
                borderRadius: BorderRadius.circular(26),
              ),
              child: Column(
                children: [
                  const Text(
                    'TOTAL A PAGAR',
                    style: TextStyle(
                      color: Colors.white70,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    moneda(resultado.totalPagar),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${porcentaje(resultado.porcentajeTotal)} de descuento',
                    style: const TextStyle(color: Colors.white70),
                  ),
                ],
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
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'DETALLE DE COMPRA',
                        style: TextStyle(
                          color: ColoresApp.turquesa,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    fila('Monto original', moneda(resultado.montoCompra)),
                    fila(
                      'Descuento por monto',
                      porcentaje(resultado.porcentajeBase),
                    ),
                    fila(
                      'Bono frecuente',
                      resultado.clienteFrecuente ? '+5%' : 'No aplica',
                    ),
                    const Divider(height: 20),
                    fila(
                      'Ahorro total',
                      moneda(resultado.valorDescuento),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 18),
            SizedBox(
              width: double.infinity,
              height: 54,
              child: OutlinedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.edit_outlined),
                label: const Text('Editar compra'),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/inicio',
                        (route) => false,
                  );
                },
                icon: const Icon(Icons.restart_alt_rounded),
                label: const Text('Nueva compra'),
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