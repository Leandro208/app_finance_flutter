import 'package:app_finance_flutter/model/movimentacao.dart';
import 'package:app_finance_flutter/model/tipo_movimentacao.dart';
import 'package:app_finance_flutter/modules/components/lista_movimentacoes.dart';
import 'package:app_finance_flutter/modules/home/adicionar.dart';
import 'package:app_finance_flutter/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final List<Movimentacao> movimentacoes;
  const HomePage({super.key, required this.movimentacoes});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double total = 0;
  late Color corTotal;
  @override
  void initState() {
    total = calcularTotal(widget.movimentacoes);
    corTotal = getCorTotal(total);
    super.initState();
  }

  void adicionarMovimentacoes(Movimentacao movimentacao) => setState(() {
        widget.movimentacoes.add(movimentacao);
        total = calcularTotal(widget.movimentacoes);
        corTotal = getCorTotal(total);
      });
  void removerMovimentacoes(Movimentacao movimentacao) => setState(() {
        widget.movimentacoes.remove(movimentacao);
        total = calcularTotal(widget.movimentacoes);
        corTotal = getCorTotal(total);
      });

  void editarMovimentacao(Movimentacao movimentacao) => setState(() {
        int indexMovimentacao = widget.movimentacoes
            .indexWhere((element) => element.id == movimentacao.id);
        if (indexMovimentacao == -1) return;
        widget.movimentacoes[indexMovimentacao] = movimentacao;
        total = calcularTotal(widget.movimentacoes);
        corTotal = getCorTotal(total);
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          Stack(
            children: [
              AppBar(
                title: const Text(
                  "Finance App",
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: AppColors.background,
                toolbarHeight: 150,
              ),
              Align(
                child: Card(
                  elevation: 3,
                  color: AppColors.onBackground,
                  shadowColor: AppColors.purple,
                  margin: const EdgeInsets.fromLTRB(25, 130, 25, 10),
                  child: Container(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Saldo",
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "R\$ ${total.toStringAsFixed(2)}",
                                style: TextStyle(
                                    color: corTotal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30),
                              ),
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 7,
                                        offset: Offset(2, 2),
                                      )
                                    ]),
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.add,
                                    size: 25,
                                    color: Colors.black,
                                  ),
                                  onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          AdicionarItem(
                                        callback: adicionarMovimentacoes,
                                        isEdit: false,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Movimentações',
                  style: TextStyle(color: Colors.grey),
                ),
                CupertinoButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  child: const Icon(
                    Icons.sort,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListaMovimentacoes(
              movimentacoes: widget.movimentacoes,
              callbackRemover: removerMovimentacoes,
              callbackEditar: editarMovimentacao,
            ),
          )
        ],
      ),
    );
  }
}

double calcularTotal(List<Movimentacao> lista) {
  double total = 0;
  for (var e in lista) {
    if (e.tipo == TipoMovimentacao.RECEITA) {
      total += e.valor;
    } else {
      total -= e.valor;
    }
  }
  return total;
}

Color getCorTotal(double valor) {
  if (valor > 0) {
    return Colors.green;
  } else if (valor < 0) {
    return Colors.red;
  } else {
    return Colors.white;
  }
}
