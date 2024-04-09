import 'dart:math';

import 'tipo_movimentacao.dart';

class Movimentacao {
  final String id;
  String titulo;
  double valor;
  DateTime data;
  String? descricao;
  TipoMovimentacao tipo;

  Movimentacao({
    required this.titulo,
    required this.valor,
    required this.data,
    required this.tipo,
    this.descricao,
  }) : id = Random().nextInt(9999).toString();
}
