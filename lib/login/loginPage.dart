import 'dart:convert';
import 'dart:io';

import 'package:condo_project/layout/layoutPage.dart';
import 'package:condo_project/unitity/ipApi.dart';
import 'package:condo_project/unitity/myStyle.dart';
import 'package:condo_project/unitity/normalDialog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //variable
   Map resp_json;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    chkLogin();
  }

  Future<Null> chkLogin() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String data_json_string = preferences.getString("data").toString();
    resp_json = json.decode(data_json_string);
    // print(resp_json);
    if (resp_json != null) {
      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (context) => LayOutPage());
      Navigator.pushAndRemoveUntil(
          context, materialPageRoute, (route) => false);
    }
  }

  Map login = {
    "telephone": null,
    "password": null,
  };

  Container logo() {
    return Container(
      padding: EdgeInsets.all(60.0),
      child: Image.asset('images/logo.png'),
    );
  }

  Container textFormFieldTelephone() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextFormField(
        keyboardType: TextInputType.phone,
        onChanged: (val) {
          login['telephone'] = val.trim();
        },
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(),
            filled: true,
            fillColor: Colors.white,
            hintText: "Telephone",
            hintStyle: TextStyle(color: Colors.black)),
      ),
    );
  }

  Container textFormFieldPassword() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextFormField(
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        onChanged: (val) {
          login['password'] = val;
        },
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(),
            filled: true,
            fillColor: Colors.white,
            hintText: "Password",
            hintStyle: TextStyle(color: Colors.black)),
      ),
    );
  }

  Container btnLogin(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.blue.shade800, // background
          onPrimary: Colors.white, // foreground
        ),
        onPressed: () {
          if (login['telephone'] == null ||
              login['telephone'].isEmpty ||
              login['password'] == null ||
              login['password'].isEmpty) {
            normalDialog('โปรดกรอกให้ครบ', context);
          } else {
            processLogin();
          }
        },
        child: Text('เข้าสู่ระบบ'),
      ),
    );
  }

  Future<Null> processGetPoint() async {
    try {
      HttpOverrides.global = new MyHttpOverrides();
      var url = Uri.parse('${Ipapi().url}/v1/check-point');
      // print(url);
      var response = await http.post(
        url,
        body: {
          'id': resp_json['data']['id'].toString(),
        },
        // headers: headers,
      );
      var point = json.decode(response.body);
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString("point", point['point']);
      // print(point['point'].toString());
    } catch (e) {
      print(e);
    }
  }

  Future<Null> processLogin() async {
    Map<String, String> headers = {
      "content-type": "application/json",
      "accept": "application/json"
    };
    try {
      HttpOverrides.global = new MyHttpOverrides();
      var url = Uri.parse('${Ipapi().url}/v1/login');
      // print(url);
      var response = await http.post(
        url,
        body: {
          'telephone': login['telephone'],
          'password': login['password'],
        },
        // headers: headers,
      );
      setState(() {
        resp_json = json.decode(response.body);
      });
      // print(resp_json);
      print('sucess');
      if (resp_json['data'] != null) {
        //เข้าสู่ระบบได้
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString("data", json.encode(resp_json['data']));
//เอาค่า point
        processGetPoint();

        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (context) => LayOutPage());
        Navigator.pushAndRemoveUntil(
            context, materialPageRoute, (route) => false);
        //แก้ไม่้ให้กลับหน้าเดิม
      } else {
        normalDialog(
            resp_json['error'] ?? resp_json['password'].toString(), context);
      }
    } catch (e) {
      print("มีerror คือ " + e.toString());
    }
  }

  Container bg_left(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      child: Image.asset("images/background.png"),
    );
  }

  Container bg_right(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      child: Image.asset(
        "images/background.png",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  bg_left(context),
                  bg_right(context),
                ],
              ),
              Container(
                // decoration: BoxDecoration(
                //   image: DecorationImage(
                //     image: AssetImage("images/background.png"),
                //     fit: BoxFit.cover,
                //     repeat: ImageRepeat.repeatX
                //   ),
                // ),
                child: Column(
                  children: [
                    logo(),
                    textFormFieldTelephone(),
                    MyStyles().mysizedBox,
                    textFormFieldPassword(),
                    MyStyles().mysizedBox,
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Image.asset('images/line_login.png'),
                    ),
                    MyStyles().mysizedBox,
                    btnLogin(context),
                    MyStyles().mysizedBox,
                    Text("Version. 1.0.0"),
                  ],
                ) /* add child content here */,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
