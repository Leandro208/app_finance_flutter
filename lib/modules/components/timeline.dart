import 'package:app_finance_flutter/model/movimentacao.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimelineMovimentacao extends StatelessWidget {
  
  final List<Movimentacao> movimentacoes;
  final Color cor;
  const TimelineMovimentacao({super.key, required this.movimentacoes, required this.cor});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Flexible(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: movimentacoes.length,
              itemBuilder: (context, i) {
                return Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(40),
                      child: Row(
                        children: [
                          SizedBox(width: size.width * 0.1),
                          SizedBox(
                            width: size.width * 0.4,
                            child: Text(DateFormat('dd/MM/yyyy').format(movimentacoes[i].data), style: const TextStyle(color: Colors.white),),
                          ),
                          SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('R\$ ${movimentacoes[i].valor.toStringAsFixed(2)}', style: const TextStyle(color: Colors.white)),
                                Text(
                                  movimentacoes[i].descricao,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 12),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      left: 50,
                      child: Container(
                        height: size.height * 0.7,
                        width: 1.0,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Container(
                          height: 20.0,
                          width: 20.0,
                          decoration: BoxDecoration(
                            color: cor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
        );
  }
}
