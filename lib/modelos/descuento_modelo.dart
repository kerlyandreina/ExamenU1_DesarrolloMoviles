class DescuentoModelo {
  final double montoCompra;
  final bool clienteFrecuente;
  final double porcentajeBase;
  final double porcentajeAdicional;
  final double porcentajeTotal;
  final double valorDescuento;
  final double totalPagar;

  const DescuentoModelo({
    required this.montoCompra,
    required this.clienteFrecuente,
    required this.porcentajeBase,
    required this.porcentajeAdicional,
    required this.porcentajeTotal,
    required this.valorDescuento,
    required this.totalPagar,
  });
}