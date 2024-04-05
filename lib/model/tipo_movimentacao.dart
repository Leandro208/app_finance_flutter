import 'package:app_finance_flutter/utils/app_colors.dart';
import 'package:flutter/material.dart';

enum TipoMovimentacao{
  DESPESA,
  RECEITA;

  Color get cor{
    switch (this) {
      case TipoMovimentacao.DESPESA:
        return AppColors.despesaColor;
      case TipoMovimentacao.RECEITA:
      return AppColors.receitaColor;
    }
  }

  IconData get icone{
    switch (this) {
      case TipoMovimentacao.DESPESA:
        return Icons.arrow_downward_rounded;
      case TipoMovimentacao.RECEITA:
        return Icons.arrow_upward_rounded;
    }
  }
}