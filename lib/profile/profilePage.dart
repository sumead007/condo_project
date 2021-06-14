
import 'package:condo_project/layout/layoutPage.dart';
import 'package:condo_project/login/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ///method
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              btnLogin(context),
            ],
          ),
        ),
      ),
    );
  }
}
