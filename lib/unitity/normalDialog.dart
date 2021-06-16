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

Future<bool> confirmDialog(var textContent, var textAccept, var textCancel,
    Color colorAccept, Color colorCancel, BuildContext context) async {
  bool status;
  await showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text('แจ้งเตือน!'),
      content: Text(textContent),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(context, textAccept);
            status = true;
          },
          child: Text(
            textAccept,
            style: TextStyle(color: colorAccept),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context, textCancel);
            status = false;
          },
          child:  Text(textCancel,style: TextStyle(color: colorCancel),),
        ),
      ],
    ),
  );
  return status;
}
