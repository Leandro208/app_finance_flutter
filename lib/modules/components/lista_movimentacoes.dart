import 'package:app_finance_flutter/model/movimentacao.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListaMovimentacoes extends StatelessWidget {
  final List<Movimentacao> movimentacoes;

  const ListaMovimentacoes({super.key, required this.movimentacoes});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        itemCount: movimentacoes.length,
        itemBuilder: (context, index) {
          final movimentacao = movimentacoes[index];
          return ListTile(
            leading: Icon(movimentacao.tipo.icone),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat('dd/MM/yyyy').format(movimentacao.data),
                  style: const TextStyle(fontSize: 10),
                ),
                Text(movimentacao.descricao)
              ],
            ),
            trailing: Text('R\$ ${movimentacao.valor.toStringAsFixed(2)}'),
            iconColor: movimentacao.tipo.cor,
            textColor: movimentacao.tipo.cor,
          );
        },
      ),
    );
  }
}
