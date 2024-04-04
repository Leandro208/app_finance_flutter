import 'package:app_finance_flutter/utils/appbar_custom.dart';
import 'package:app_finance_flutter/utils/themes.dart';
import 'package:flutter/material.dart';

class AdicionarItem extends StatefulWidget {
  static const String rota = '/adicionar_item';
  const AdicionarItem({super.key});

  @override
  State<AdicionarItem> createState() => _AdicionarItemState();
}

class _AdicionarItemState extends State<AdicionarItem> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Themes.background,
      appBar: AppBarCustomWidget(),
      body: Column(
        children: [Text('oi')],
      ),
    );
  }
}
