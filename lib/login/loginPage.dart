import 'package:condo_project/layout/layoutPage.dart';
import 'package:condo_project/unitity/myStyle.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
          MaterialPageRoute materialPageRoute =
              MaterialPageRoute(builder: (context) => LayOutPage());
          // Navigator.of(context).push(materialPageRoute);
          Navigator.pushAndRemoveUntil(
              context, materialPageRoute, (route) => false);
          //แก้ไม่้ให้กลับหน้าเดิม
        },
        child: Text('เข้าสู่ระบบ'),
      ),
    );
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
