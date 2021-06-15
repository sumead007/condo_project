import 'dart:convert';

import 'package:condo_project/layout/layoutPage.dart';
import 'package:condo_project/login/loginPage.dart';
import 'package:condo_project/unitity/getData/getData.dart';
import 'package:condo_project/unitity/myStyle.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
//variable
  Map user;
  final fnameController = TextEditingController(text: '');
  final froomController = TextEditingController(text: '');
  final fpriceroom = TextEditingController(text: '');
  final ftel = TextEditingController(text: '');

  ///method
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getUser();
  }

  void getUser() {
    try {
      processGetUser().then((value) {
        setState(() {
          user = json.decode(value);
        });
        print(user);
        fnameController.text = user['residents_prefix'].toString() +
            user['residents_name'].toString() +
            " (" +
            user['residents_nickname'] +
            ")";
        froomController.text = user['rooms_number'];
        fpriceroom.text = user['rooms_standard_price'];
        ftel.text = user['residents_telephone'];
      });
    } catch (e) {
      print("มีerror =>>>" + e.toString());
    }
  }

  Container btnLogin(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.red, // background
          onPrimary: Colors.white, // foreground
        ),
        onPressed: () {
          processLogout(context);
        },
        child: Text('ออกจากระบบ'),
      ),
    );
  }

  Future<Null> processLogout(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
    MaterialPageRoute materialPageRoute =
        MaterialPageRoute(builder: (context) => LoginPage());
    Navigator.pushAndRemoveUntil(context, materialPageRoute, (route) => false);
  }

  Container imgProfile(BuildContext context) {
    return Container(
      child: Image.network(
          'https://www.seekpng.com/png/detail/41-410093_circled-user-icon-user-profile-icon-png.png'),
      width: MediaQuery.of(context).size.width * 0.4,
    );
  }

  Container fieldFName(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextFormField(
        controller: fnameController,
        readOnly: true,
        decoration: new InputDecoration(
          labelText: "ชื่อ-สกุล",
          fillColor: Colors.white,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(25.0),
            borderSide: new BorderSide(),
          ),
          //fillColor: Colors.green
        ),
        // keyboardType: TextInputType.emailAddress,
        style: new TextStyle(
          fontFamily: "Poppins",
        ),
      ),
    );
  }

  Container fieldRoom(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextFormField(
        controller: froomController,
        readOnly: true,
        decoration: new InputDecoration(
          labelText: "ห้องที่: ",
          fillColor: Colors.white,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(25.0),
            borderSide: new BorderSide(),
          ),
          //fillColor: Colors.green
        ),
        // keyboardType: TextInputType.emailAddress,
        style: new TextStyle(
          fontFamily: "Poppins",
        ),
      ),
    );
  }

  Container fieldPriceRoom(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextFormField(
        controller: fpriceroom,
        readOnly: true,
        decoration: new InputDecoration(
          labelText: "ค่าเช่า: ",
          fillColor: Colors.white,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(25.0),
            borderSide: new BorderSide(),
          ),
          //fillColor: Colors.green
        ),
        // keyboardType: TextInputType.emailAddress,
        style: new TextStyle(
          fontFamily: "Poppins",
        ),
      ),
    );
  }

  Container fieldTel(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextFormField(
        controller: ftel,
        readOnly: true,
        decoration: new InputDecoration(
          labelText: "เบอรโทร: ",
          fillColor: Colors.white,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(25.0),
            borderSide: new BorderSide(),
          ),
          //fillColor: Colors.green
        ),
        // keyboardType: TextInputType.emailAddress,
        style: new TextStyle(
          fontFamily: "Poppins",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                imgProfile(context),
                MyStyles().mysizedBox,
                fieldFName(context),
                MyStyles().mysizedBox,
                fieldRoom(context),
                MyStyles().mysizedBox,
                fieldPriceRoom(context),
                MyStyles().mysizedBox,
                fieldTel(context),
                MyStyles().mysizedBox,
                btnLogin(context),
                MyStyles().mysizedBox,
                MyStyles().mysizedBox,
                MyStyles().mysizedBox,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
