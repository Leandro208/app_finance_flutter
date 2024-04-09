import 'package:app_finance_flutter/model/movimentacao.dart';
import 'package:app_finance_flutter/model/tipo_movimentacao.dart';
import 'package:app_finance_flutter/modules/home/home_page.dart';
import 'package:app_finance_flutter/modules/resumos/despesa.dart';
import 'package:app_finance_flutter/modules/resumos/receitas.dart';
import 'package:app_finance_flutter/utils/app_colors.dart';
import 'package:flutter/material.dart';

class InicialPage extends StatefulWidget {
  const InicialPage({super.key});

  @override
  State<InicialPage> createState() => _InicialPageState();
}

class _InicialPageState extends State<InicialPage> {
  int _selectedIndex = 1;
  bool _showLabels = true;

  late final List<Movimentacao> _movimentacoes; // Alteração aqui
  late final List<Movimentacao> _despesas;
  late final List<Movimentacao> _receitas;
  late final List<Widget> _pages; // Alteração aqui

  @override
  void initState() {
    super.initState();
    
    _movimentacoes = []; // Inicialize _movimentacoes aqui
    _receitas = [];
    _despesas = [];

    _pages = [
      DespesasResumo(despesas: _despesas,),
      HomePage(movimentacoes: _movimentacoes,),
      ReceitasResumo(receitas: _receitas,),
    ]; // Inicialize _pages aqui
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _showLabels = true;
      for(Movimentacao mov in _movimentacoes){
          if(mov.tipo == TipoMovimentacao.DESPESA){
            if(!_despesas.contains(mov)){
                _despesas.add(mov);
                _despesas.sort((a, b) => b.data.compareTo(a.data),);
            }
          } else {
            if(!_receitas.contains(mov)){
                _receitas.add(mov);
                _receitas.sort((a, b) => b.data.compareTo(a.data),);
            }
          }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.background,

        showSelectedLabels:
            _showLabels, // Mostra o rótulo apenas do item selecionado
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.remove_circle_outline_rounded),
            label: 'Despesas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline_rounded),
            label: 'Receitas',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
