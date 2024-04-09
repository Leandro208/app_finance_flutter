import 'package:app_finance_flutter/utils/app_colors.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarCustomWidget extends StatefulWidget implements PreferredSizeWidget {
  final Function(DateTime) callback;
  const AppBarCustomWidget({super.key, required this.callback});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  State<AppBarCustomWidget> createState() => _AppBarCustomWidgetState();
}

class _AppBarCustomWidgetState extends State<AppBarCustomWidget> {
  DateTime data = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: AppColors.onBackground,
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
            onPressed: () => mostrarData(),
            icon: const Icon(CupertinoIcons.calendar, color: Colors.white70),
          )
        ],
        title: customRichText('Adicionar novo valor',
            '${data.day < 10 ? '0' : ''}${data.day}/${data.month < 10 ? '0' : ''}${data.month}/${data.year}'));
  }

  void mostrarData() => showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1974),
        lastDate: DateTime(2025),
      ).then((pickedDate) {
        if (pickedDate == null) return;

        setState(() {
          data = pickedDate;
        });
        widget.callback(pickedDate);
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
