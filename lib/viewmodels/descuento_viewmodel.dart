import 'package:flutter/foundation.dart';

import '../modelos/descuento_modelo.dart';

class DescuentoViewModel extends ChangeNotifier {
  bool esClienteFrecuente = false;

  void seleccionarClienteFrecuente(bool frecuente) {
    esClienteFrecuente = frecuente;
    notifyListeners();
  }

  void reiniciar() {
    esClienteFrecuente = false;
    notifyListeners();
  }

  DescuentoModelo calcular(double montoCompra) {
    double porcentajeBase = 0;

    if (montoCompra >= 500) {
      porcentajeBase = 0.15;
    } else if (montoCompra >= 300) {
      porcentajeBase = 0.10;
    } else if (montoCompra >= 100) {
      porcentajeBase = 0.05;
    }

    final porcentajeAdicional = esClienteFrecuente ? 0.05 : 0.0;
    final porcentajeTotal = porcentajeBase + porcentajeAdicional;
    final valorDescuento = montoCompra * porcentajeTotal;
    final totalPagar = montoCompra - valorDescuento;

    return DescuentoModelo(
      montoCompra: montoCompra,
      clienteFrecuente: esClienteFrecuente,
      porcentajeBase: porcentajeBase,
      porcentajeAdicional: porcentajeAdicional,
      porcentajeTotal: porcentajeTotal,
      valorDescuento: valorDescuento,
      totalPagar: totalPagar,
    );
  }
}