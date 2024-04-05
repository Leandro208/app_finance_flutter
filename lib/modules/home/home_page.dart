import 'package:app_finance_flutter/model/movimentacao.dart';
import 'package:app_finance_flutter/model/tipo_movimentacao.dart';
import 'package:app_finance_flutter/modules/components/lista_movimentacoes.dart';
import 'package:app_finance_flutter/modules/home/adicionar.dart';
import 'package:app_finance_flutter/utils/app_colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Movimentacao> _movimentacoes = [
    Movimentacao(
        descricao: 'Venda',
        valor: 528.12,
        data: DateTime.now(),
        tipo: TipoMovimentacao.RECEITA),
    Movimentacao(
        descricao: 'Internet',
        valor: 129.02,
        data: DateTime.now(),
        tipo: TipoMovimentacao.DESPESA),
    Movimentacao(
        descricao: 'Internet',
        valor: 129.02,
        data: DateTime.now(),
        tipo: TipoMovimentacao.DESPESA),
    Movimentacao(
        descricao: 'Venda',
        valor: 528.12,
        data: DateTime.now(),
        tipo: TipoMovimentacao.RECEITA),
    Movimentacao(
        descricao: 'Internet',
        valor: 129.02,
        data: DateTime.now(),
        tipo: TipoMovimentacao.DESPESA),
    Movimentacao(
        descricao: 'Despesa Teste',
        valor: 528.12,
        data: DateTime.now(),
        tipo: TipoMovimentacao.DESPESA)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => const AdicionarItem(),
          ),
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              AppBar(
                title: const Text(
                  "Finance App",
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: AppColors.primaryColor,
                toolbarHeight: 150,
              ),
              Align(
                child: Card(
                  elevation: 3,
                  color: Colors.white,
                  shadowColor: AppColors.primaryColor,
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
                              const Text(
                                "R\$ 500,46",
                                style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30),
                              ),
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
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
                                    color: Colors.white,
                                  ),
                                  onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          const AdicionarItem(),
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
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Movimentações',
                  style: TextStyle(color: Colors.grey),
                ),
                Icon(
                  Icons.sort,
                  color: Colors.grey,
                )
              ],
            ),
          ),
          Expanded(
            child: ListaMovimentacoes(movimentacoes: _movimentacoes)
          ),
        ],
      ),
    );
  }
}