import 'package:app_finance_flutter/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  shadowColor: Colors.green,
                  margin: const EdgeInsets.fromLTRB(25, 130, 25, 10),
                  child: Container(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total",
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "500",
                                style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 35),
                              ),
                              Container(
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
                                child: const Icon(
                                  Icons.add,
                                  size: 35,
                                  color: Colors.white,
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
          Expanded(
            child: Container(
              child: Column(
                children: [
                 Padding(
                   padding: const EdgeInsets.all(20.0),
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text('Movimentações', style: TextStyle(color: Colors.grey),),
                    Icon(Icons.sort, color: Colors.grey,)
                   ],),
                 ),
                  exibirMovimentacao(Icons.arrow_upward_rounded, Colors.green, 'Venda', 200),
                  exibirMovimentacao(Icons.arrow_downward_rounded, Colors.red, 'Internet', -500)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

ListTile exibirMovimentacao(IconData icone, Color cor, String descricao, double valor) {
  return ListTile(
    leading: Icon(icone),
    title: Text(descricao),
    trailing: Text('$valor'),
    iconColor: cor,
    textColor: cor,
  );
}
