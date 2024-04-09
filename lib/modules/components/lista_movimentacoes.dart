import 'package:app_finance_flutter/model/movimentacao.dart';
import 'package:app_finance_flutter/model/tipo_movimentacao.dart';
import 'package:app_finance_flutter/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListaMovimentacoes extends StatelessWidget {
  final Function(Movimentacao) callback;
  final List<Movimentacao> movimentacoes;
  final bool limitarQntHomePage;
  const ListaMovimentacoes({
    super.key,
    required this.movimentacoes,
    required this.callback,
    required this.limitarQntHomePage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        itemCount: limitarQntHomePage
            ? movimentacoes.length > 5
                ? 5
                : movimentacoes.length
            : movimentacoes.length,
        itemBuilder: (context, index) {
          final movimentacao = movimentacoes[index];
          return GestureDetector(
            onTap: () async => await _showBottomSheet(context, movimentacao),
            child: Dismissible(
              key: Key(movimentacao.id),
              confirmDismiss: (direction) async =>
                  await _showBottomSheet(context, movimentacao),
              background: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red.withOpacity(0.5),
                ),
                padding: const EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                child: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
              child: ListTile(
                leading: Icon(movimentacao.tipo.icone),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat('dd/MM/yyyy').format(movimentacao.data),
                      style: const TextStyle(fontSize: 10),
                    ),
                    Text(movimentacao.titulo)
                  ],
                ),
                trailing: Text('R\$ ${movimentacao.valor.toStringAsFixed(2)}'),
                iconColor: movimentacao.tipo.cor,
                textColor: movimentacao.tipo.cor,
              ),
            ),
          );
        },
      ),
    );
  }

  Future _showBottomSheet(
      BuildContext context, Movimentacao movimentacao) async {
    await showModalBottomSheet(
      backgroundColor: AppColors.background,
      context: context,
      builder: (contextModal) => Container(
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 15,
          right: 15,
          top: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text(
              'Detalhes da despesa',
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            const SizedBox(height: 15),
            Text(
              movimentacao.titulo,
              style: const TextStyle(color: Colors.white, fontSize: 15),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  movimentacao.tipo.icone,
                  color: movimentacao.tipo == TipoMovimentacao.DESPESA
                      ? Colors.redAccent
                      : Colors.green,
                ),
                Text(
                  'R\$ ${movimentacao.valor}',
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(width: 25),
                Text(
                  'Data: ${movimentacao.data.day < 10 ? '0' : ''}${movimentacao.data.day}/${movimentacao.data.month < 10 ? '0' : ''}${movimentacao.data.month}/${movimentacao.data.year} ',
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 15),
            if (movimentacao.descricao != null)
              Text(
                'Descrição: ${movimentacao.descricao}',
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 1,
                  child: CupertinoButton(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    color: Colors.blueAccent,
                    onPressed: () {
                      // callback(movimentacao);

                      Navigator.pop(contextModal);
                    },
                    child: const Text('Editar'),
                  ),
                ),
                const SizedBox(width: 25),
                Flexible(
                  flex: 1,
                  child: CupertinoButton(
                    color: Colors.redAccent,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    onPressed: () {
                      callback(movimentacao);

                      Navigator.pop(contextModal);
                    },
                    child: const Text('Apagar'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
