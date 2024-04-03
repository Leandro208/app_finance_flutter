import 'package:app_finance_flutter/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReceitasResumo extends StatefulWidget {
  const ReceitasResumo({super.key});

  @override
  State<ReceitasResumo> createState() => _ReceitasResumoState();
}

class _ReceitasResumoState extends State<ReceitasResumo> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.receitaColor,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Text('Receitas',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
                fontFamily: AutofillHints.streetAddressLine1)),
      ),
    );
  }
}