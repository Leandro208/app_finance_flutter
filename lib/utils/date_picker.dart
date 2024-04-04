import 'package:flutter/material.dart';

Future themedDatePicker(DateTime? data, BuildContext context) async {
  return showDialog<DateTime>(
    context: context,
    builder: (BuildContext context) {
      return Theme(
        data: Theme.of(context),
        child: DatePickerDialog(
          initialDate: data ?? DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        ),
      );
    },
  );
}
