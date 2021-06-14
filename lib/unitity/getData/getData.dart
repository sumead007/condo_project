import 'dart:convert';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';


Future<String?> processGetPoint() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("point");
}

Future<String?> processGetUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("data");
}
