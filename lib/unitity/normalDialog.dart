import 'package:flutter/material.dart';

Future<void> normalDialog(var text, BuildContext context) async {
  await showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text('แจ้งเตือน!'),
      content: Text(text),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ],
    ),
  );
}
