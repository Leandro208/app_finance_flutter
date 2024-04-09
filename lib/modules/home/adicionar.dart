import 'dart:math';

import 'package:app_finance_flutter/model/movimentacao.dart';
import 'package:app_finance_flutter/model/tipo_movimentacao.dart';
import 'package:app_finance_flutter/utils/app_colors.dart';
import 'package:app_finance_flutter/utils/appbar_custom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdicionarItem extends StatefulWidget {
  static const String rota = '/adicionar_item';
  final bool isEdit;
  final Movimentacao? movimentacaoEdit;
  final int? index;
  final Function(Movimentacao) callback;
  const AdicionarItem({
    super.key,
    required this.callback,
    required this.isEdit,
    this.movimentacaoEdit,
    this.index,
  });

  @override
  State<AdicionarItem> createState() => _AdicionarItemState();
}

class _AdicionarItemState extends State<AdicionarItem> {
  @override
  void initState() {
    if (widget.isEdit) {
      titulo = TextEditingController(text: widget.movimentacaoEdit!.titulo);
      quantia = TextEditingController(
          text: widget.movimentacaoEdit!.valor.toString());
      data = widget.movimentacaoEdit!.data;
      tipoEscolhido = widget.movimentacaoEdit!.tipo;
      tipoEscolhido == TipoMovimentacao.DESPESA
          ? corFundoDespesa = Colors.red
          : corFundoReceita = Colors.green;
      descricao =
          TextEditingController(text: widget.movimentacaoEdit!.descricao);
    }
    super.initState();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController titulo = TextEditingController();
  TextEditingController quantia = TextEditingController();
  DateTime data = DateTime.now();
  TextEditingController descricao = TextEditingController();
  TipoMovimentacao? tipoEscolhido;
  Color? corFundoDespesa;
  Color? corFundoReceita;
  bool continuarAdicionando = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBarCustomWidget(callback: setDate),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextField(
                  controller: titulo,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Título',
                    border: OutlineInputBorder(),
                    isDense: true,
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildTipoMovimentacao(
                        TipoMovimentacao.DESPESA, Colors.red),
                    _buildTipoMovimentacao(
                        TipoMovimentacao.RECEITA, Colors.green)
                  ],
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: quantia,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Quantia',
                    border: OutlineInputBorder(),
                    isDense: true,
                  ),
                  validator: (String? value) {
                    if (value != null && value.isEmpty) {
                      return 'Por favor, adicione uma quantia.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: descricao,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Descrição',
                    border: OutlineInputBorder(),
                    isDense: true,
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CupertinoButton(
                      color: Colors.lightBlue,
                      onPressed: () {
                        if (tipoEscolhido != null &&
                            (_formKey.currentState?.validate() ?? false)) {
                          widget.callback(
                            Movimentacao(
                              id: widget.isEdit
                                  ? widget.movimentacaoEdit!.id
                                  : Random().nextInt(9999).toString(),
                              titulo: titulo.text,
                              valor: double.parse(quantia.text),
                              data: data,
                              tipo: tipoEscolhido!,
                              descricao: descricao.text,
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Movimentação adicionada!')));
                          if (!continuarAdicionando) {
                            continuarAdicionando = false;
                            Navigator.pop(context);
                            return;
                          }
                          setState(() {
                            titulo.clear();
                            quantia.clear();
                            data = DateTime.now();
                            tipoEscolhido = null;
                          });
                        }
                      },
                      child: Text(
                        continuarAdicionando
                            ? 'P R O X I M O'
                            : widget.isEdit
                                ? 'C O N F I R M A R'
                                : 'A D I C I O N A R',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 10),
                      ),
                    ),
                    const SizedBox(width: 10),
                    CupertinoButton(
                      color: Colors.grey,
                      padding: EdgeInsets.zero,
                      child: const Icon(CupertinoIcons.link),
                      onPressed: () => setState(() {
                        continuarAdicionando = !continuarAdicionando;
                      }),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTipoMovimentacao(
      TipoMovimentacao tipoMovimentacao, Color color) {
    switch (tipoMovimentacao) {
      case TipoMovimentacao.DESPESA:
        return GestureDetector(
          onTap: () {
            setState(() {
              corFundoDespesa = Colors.red;
              corFundoReceita = null;
              tipoEscolhido = tipoMovimentacao;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: corFundoDespesa,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: color),
            ),
            padding: const EdgeInsets.all(10),
            child: Text(
              tipoMovimentacao.name,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      case TipoMovimentacao.RECEITA:
        return GestureDetector(
          onTap: () {
            setState(() {
              corFundoReceita = Colors.green;
              corFundoDespesa = null;
              tipoEscolhido = tipoMovimentacao;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: corFundoReceita,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: color),
            ),
            padding: const EdgeInsets.all(10),
            child: Text(
              tipoMovimentacao.name,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
    }
  }

  void setDate(DateTime dataSelecionada) => data = dataSelecionada;
}
