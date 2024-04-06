import 'tipo_movimentacao.dart';

class Movimentacao {
  String descricao;
  double valor;
  DateTime data;
  TipoMovimentacao tipo;

  Movimentacao({required this.descricao, required this.valor, required this.data, required this.tipo});
}