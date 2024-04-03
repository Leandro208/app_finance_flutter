import 'package:app_finance_flutter/utils/app_colors.dart';
import 'package:flutter/material.dart';

class DespesasResumo extends StatefulWidget {
  const DespesasResumo({super.key});

  @override
  State<DespesasResumo> createState() => _DespesasResumoState();
}

class _DespesasResumoState extends State<DespesasResumo> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.despesaColor,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Text('Despesas',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
                fontFamily: AutofillHints.streetAddressLine1)),
      ),
    );
  }
}
