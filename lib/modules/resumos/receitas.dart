import 'dart:math';

import 'package:app_finance_flutter/model/movimentacao.dart';
import 'package:app_finance_flutter/model/tipo_movimentacao.dart';
import 'package:app_finance_flutter/modules/components/timeline.dart';
import 'package:app_finance_flutter/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ReceitasResumo extends StatefulWidget {
  const ReceitasResumo({super.key});
  @override
  State<ReceitasResumo> createState() => _ReceitasResumoState();
}

class _ReceitasResumoState extends State<ReceitasResumo> {
  final List<Movimentacao> _receitas = [
    Movimentacao(
        id: Random().nextInt(9999).toString(),
        titulo: 'Internet',
        valor: 129.02,
        data: DateTime.now(),
        tipo: TipoMovimentacao.RECEITA),
    Movimentacao(
        id: Random().nextInt(9999).toString(),
        titulo: 'Internet',
        valor: 129.02,
        data: DateTime.now(),
        tipo: TipoMovimentacao.RECEITA),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.receitaColorPrimary,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 0, 0),
            child: Text('Receitas',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    fontFamily: AutofillHints.streetAddressLine1)),
          ),
          TimelineMovimentacao(
            movimentacoes: _receitas,
            cor: AppColors.receitaColorSecondary,
          )
        ],
      ),
    );
  }
}
