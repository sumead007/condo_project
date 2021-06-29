import 'dart:convert';
import 'dart:io';

import 'package:condo_project/unitity/getData/getData.dart';
import 'package:condo_project/unitity/getData/logout.dart';
import 'package:condo_project/unitity/ipApi.dart';
import 'package:condo_project/unitity/myStyle.dart';
import 'package:condo_project/unitity/normalDialog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../main.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key key}) : super(key: key);

  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  //variable
  String old_password, new_password, confirm_password;
  Map user, resp_json;
//method
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserU();
  }

  void getUserU() {
    processGetUser().then((value) {
      setState(() {
        user = json.decode(value);
      });
      // print(user);
    });
  }

  Future<void> processChangePassword() async {
    try {
      HttpOverrides.global = new MyHttpOverrides();
      var url = Uri.parse('${Ipapi().url}/v1/reset');
      // print(url);
      List telephone = user['residents_telephone'].split('-');
      // print(tel);
      var response = await http.post(
        url,
        body: {
          'telephone': (telephone[0] + telephone[1]).toString(),
          'oldpassword': old_password,
          'newpassword': new_password,
        },
        // headers: headers,
      );
      setState(() {
        resp_json = json.decode(response.body);
        // print(resp_json);
        if (resp_json['result'] == '1') {
          normalDialog(resp_json['message'] + " และกรุณาล็อกอินใหม่", context)
              .then((value) {
            processLogout(context);
          });
        } else {
          normalDialog(resp_json['message'], context);
        }
      });
      // print(resp_json);
    } catch (e) {
      print("มีerror =>>>" + e.toString());
    }
  }

  Container fieldOldPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextFormField(
        // controller: fnameController,
        // readOnly: true,
        decoration: new InputDecoration(
          labelText: "รหัสผ่านเก่า",
          fillColor: Colors.white,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(25.0),
            borderSide: new BorderSide(),
          ),
          //fillColor: Colors.green
        ),
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        style: new TextStyle(
          fontFamily: "Poppins",
        ),
        onChanged: (val) {
          old_password = val;
        },
      ),
    );
  }

  Container fieldNewPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextFormField(
        // controller: fnameController,
        // readOnly: true,
        decoration: new InputDecoration(
          labelText: "รหัสผ่านใหม่",
          fillColor: Colors.white,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(25.0),
            borderSide: new BorderSide(),
          ),
          //fillColor: Colors.green
        ),
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        style: new TextStyle(
          fontFamily: "Poppins",
        ),
        onChanged: (val) {
          new_password = val;
        },
      ),
    );
  }

  Container fieldConfirmPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextFormField(
        // controller: fnameController,
        // readOnly: true,
        decoration: new InputDecoration(
          labelText: "ยืนยันรหัสผ่านใหม่",
          fillColor: Colors.white,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(25.0),
            borderSide: new BorderSide(),
          ),
          //fillColor: Colors.green
        ),
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        style: new TextStyle(
          fontFamily: "Poppins",
        ),
        onChanged: (val) {
          confirm_password = val;
        },
      ),
    );
  }

  Column btnSave(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.08,
          child: ElevatedButton(
            onPressed: () {
              if (old_password == null ||

                  ///เช็คช่องว่าง
                  old_password.isEmpty ||
                  new_password == null ||
                  new_password.isEmpty ||
                  confirm_password == null ||
                  confirm_password.isEmpty) {
                normalDialog('กรุณากรอกในครบทุกช่อง', context);
              } else {
                if (new_password.length < 4 ||

                    ///เชค ตัวอักษร
                    old_password.length < 4 ||
                    confirm_password.length < 4) {
                  normalDialog(
                      'ทุกช่องต้องมีอย่างน้อย 4 ตัวอักษร !!!', context);
                } else {
                  ///สำเร็จ
                  if (new_password == confirm_password) {
                    confirmDialog('คุณต้องการบันทึกใช่หรือไม่ ?', 'ตกลง',
                            'ยกเลิก', Colors.blue, Colors.red, context)
                        .then((value) {
                      if (value) {
                        processChangePassword();
                      }
                    });
                  } else {
                    //ไม่ตรงกัน
                    normalDialog(
                        'กรุณายืนยันรหัสผ่านใหม่อีกครั้ง !!!', context);
                  }
                }
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.save),
                Text('บันทึก'),
              ],
            ),
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.green)),
          ),
          width: MediaQuery.of(context).size.width,
        ),
      ],
    );
  }

  Center bodyTextfile(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          fieldOldPassword(context),
          MyStyles().mysizedBox,
          fieldNewPassword(context),
          MyStyles().mysizedBox,
          fieldConfirmPassword(context),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เปลี่ยนรหัสผ่าน'),
      ),
      body: Stack(
        children: [
          bodyTextfile(context),
          btnSave(context),
        ],
      ),
    );
  }
}
