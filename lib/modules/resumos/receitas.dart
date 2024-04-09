import 'dart:math';

import 'package:app_finance_flutter/model/movimentacao.dart';
import 'package:app_finance_flutter/modules/components/timeline.dart';
import 'package:app_finance_flutter/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ReceitasResumo extends StatefulWidget {
  final List<Movimentacao> receitas;
  const ReceitasResumo({super.key, required this.receitas});
  @override
  State<ReceitasResumo> createState() => _ReceitasResumoState();
}

class _ReceitasResumoState extends State<ReceitasResumo> {
  

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
            movimentacoes: widget.receitas,
            cor: AppColors.receitaColorSecondary,
          )
        ],
      ),
    );
  }
}
