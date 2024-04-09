import 'package:app_finance_flutter/model/movimentacao.dart';
import 'package:app_finance_flutter/model/tipo_movimentacao.dart';
import 'package:app_finance_flutter/modules/components/timeline.dart';
import 'package:app_finance_flutter/utils/app_colors.dart';
import 'package:flutter/material.dart';

class DespesasResumo extends StatefulWidget {
  const DespesasResumo({super.key});

  @override
  State<DespesasResumo> createState() => _DespesasResumoState();
}

class _DespesasResumoState extends State<DespesasResumo> {
  final List<Movimentacao> _despesas = [
    Movimentacao(
        titulo: 'Internet',
        valor: 129.02,
        data: DateTime.now(),
        tipo: TipoMovimentacao.DESPESA),
    Movimentacao(
        titulo: 'Internet',
        valor: 129.02,
        data: DateTime.now(),
        tipo: TipoMovimentacao.DESPESA),
    Movimentacao(
        titulo: 'Internet',
        valor: 129.02,
        data: DateTime.now(),
        tipo: TipoMovimentacao.DESPESA),
    Movimentacao(
        titulo: 'Despesa Teste',
        valor: 528.12,
        data: DateTime.now(),
        tipo: TipoMovimentacao.DESPESA),
    Movimentacao(
        titulo: 'Despesa Teste',
        valor: 528.12,
        data: DateTime.now(),
        tipo: TipoMovimentacao.DESPESA),
    Movimentacao(
        titulo: 'Despesa Teste',
        valor: 528.12,
        data: DateTime.now(),
        tipo: TipoMovimentacao.DESPESA)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.despesaColorPrimary,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 0, 0),
            child: Text('Despesas',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    fontFamily: AutofillHints.streetAddressLine1)),
          ),
          TimelineMovimentacao(
            movimentacoes: _despesas,
            cor: AppColors.despesaColorSecondary,
          )
        ],
      ),
    );
  }
}
