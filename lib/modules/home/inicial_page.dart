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

  final List<Widget> _pages = [
    const DespesasResumo(),
    const HomePage(),
    const ReceitasResumo(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _showLabels = true;
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
