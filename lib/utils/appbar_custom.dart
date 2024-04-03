import 'package:app_finance_flutter/utils/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarCustomWidget extends StatefulWidget implements PreferredSizeWidget {
  const AppBarCustomWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  State<AppBarCustomWidget> createState() => _AppBarCustomWidgetState();
}

class _AppBarCustomWidgetState extends State<AppBarCustomWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Themes.onBackground,
        leading: CupertinoButton(
          onPressed: () => Navigator.pop(context),
          padding: EdgeInsets.zero,
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white70,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.clock, color: Colors.white70),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.calendar, color: Colors.white70),
          )
        ],
        title: customRichText('Adicionar novo valor', '3 Apr 2024'));
  }

  void mostrarData() => showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2025),
      ).then((pickedDate) {
        if (pickedDate == null) return;

        setState(() {});
      });

  RichText customRichText(String titulo, String descricao) => RichText(
        text: TextSpan(
          text: '$titulo\n',
          style: const TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
          children: <TextSpan>[
            TextSpan(
              text: descricao.isEmpty ? '-' : descricao,
              style: const TextStyle(fontSize: 13, color: Colors.white70),
            ),
          ],
        ),
      );
}
