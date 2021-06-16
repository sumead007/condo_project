import 'package:condo_project/login/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<Null> processLogout(BuildContext context) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.clear();
  MaterialPageRoute materialPageRoute =
      MaterialPageRoute(builder: (context) => LoginPage());
  Navigator.pushAndRemoveUntil(context, materialPageRoute, (route) => false);
}
