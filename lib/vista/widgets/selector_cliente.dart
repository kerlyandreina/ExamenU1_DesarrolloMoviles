import 'package:flutter/material.dart';

import '../tema/colores_app.dart';

class SelectorCliente extends StatelessWidget {
  final bool esClienteFrecuente;
  final ValueChanged<bool> onSeleccionar;

  const SelectorCliente({
    super.key,
    required this.esClienteFrecuente,
    required this.onSeleccionar,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      children: [
        ChoiceChip(
          avatar: const Icon(Icons.person_outline_rounded),
          label: const Text('Ocasional'),
          selected: !esClienteFrecuente,
          selectedColor: ColoresApp.menta,
          onSelected: (_) => onSeleccionar(false),
        ),
        ChoiceChip(
          avatar: const Icon(Icons.stars_rounded),
          label: const Text('Frecuente · +5%'),
          selected: esClienteFrecuente,
          selectedColor: ColoresApp.menta,
          onSelected: (_) => onSeleccionar(true),
        ),
      ],
    );
  }
}