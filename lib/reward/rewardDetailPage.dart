import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:condo_project/unitity/getData/getData.dart';
import 'package:condo_project/unitity/ipApi.dart';
import 'package:condo_project/unitity/myStyle.dart';
import 'package:condo_project/unitity/normalDialog.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import '../main.dart';

class RewardDetailPage extends StatefulWidget {
  const RewardDetailPage({Key key}) : super(key: key);

  @override
  _RewardDetailPageState createState() => _RewardDetailPageState();
}

class _RewardDetailPageState extends State<RewardDetailPage> {
//variable
  Map user;
  var point;
  Map resp_json;
  String code = "ลองอีกครั้ง";
  int estimateTs = DateTime(2021, 6, 15, 7, 15, 30)
      .millisecondsSinceEpoch; // set needed date
  // int estimateTs = DateTime(2021, 6, 15, 7, 15, 30)
  // .millisecondsSinceEpoch; // set needed date

  //method
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getUserU();
    getPointU();
  }

  Future<void> processExchange() async {
    // print(user['residents_name']);
    try {
      HttpOverrides.global = new MyHttpOverrides();
      var url = Uri.parse('${Ipapi().url}/v1/exchange');
      // print(url);
      var response = await http.post(
        url,
        body: {
          'id': user['id'].toString(),
          'session': user['residents_session'],
        },
        // headers: headers,
      );
      setState(() {
        resp_json = json.decode(response.body);
        setDateTime(resp_json);
        getCode(resp_json);
      });

      print(resp_json);
    } catch (e) {
      print("มีerror =>>>" + e.toString());
    }
  }

  void getCode(Map data) {
    code = data['code'].toString();
  }

  void setDateTime(Map dtime) {
    try {
      // print(time);
      String str = dtime['expire'].toString();
      //split string
      var arr = str.split(' ');
      print(arr);
      var date = arr[0].split('-');
      print(date);
      var time = arr[1].split(':');
      print(time);

      setState(() {
        estimateTs = DateTime(
                int.parse(date[0]),
                int.parse(date[1]),
                int.parse(date[2]),
                int.parse(time[0]),
                int.parse(time[1]),
                int.parse(time[2]))
            .millisecondsSinceEpoch;
      });
    } catch (e) {
      print(e);
    }
  }

  void getUserU() {
    processGetUser().then((value) {
      setState(() {
        user = json.decode(value);
      });
      // print(user);
      processExchange();
    });
  }

  void getPointU() {
    processGetPoint().then((value) {
      setState(() {
        point = value;
      });
    });
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  Widget textYourPoint() => Align(
        alignment: Alignment.center,
        child: Text(
          "แต้มที่คุณมี: $point",
          style: TextStyle(fontSize: 28.0),
        ),
      );

  Widget textTimeOut() => Align(
        alignment: Alignment.center,
        child: Text(
          "เวลาหมดอายุ: ",
          style: TextStyle(fontSize: 28.0),
        ),
      );

  Widget textCode() => Align(
        alignment: Alignment.center,
        child: Text(
          "โค้ด: $code",
          style: TextStyle(fontSize: 28.0),
        ),
      );

  Widget textNameProduct() => Align(
        alignment: Alignment.center,
        child: Text(
          "แลกสินค้าในร้าน FamilyMart",
          style: TextStyle(fontSize: 28.0),
        ),
      );

  Container btnOk(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.red, // background
          onPrimary: Colors.white, // foreground
        ),
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(
          'ออก',
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }

  Padding imgProduct() {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Container(
        child: Image.network(
          "https://d2pa5gi5n2e1an.cloudfront.net/webp/global/images/product/mobilephones/Apple_iPhone_X_/Apple_iPhone_X__L_1.jpg",
          fit: BoxFit.cover,
        ),
        padding: EdgeInsets.all(20.0),
        // height: 135.0,
        // width: 135.0,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.0,
            color: Color(0xFFF9AD16),
          ),
        ),
      ),
    );
  }

  StreamBuilder<int> timmer() {
    return StreamBuilder(
        stream: Stream.periodic(Duration(seconds: 1), (i) => i),
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          DateFormat format = DateFormat("mm:ss");
          int now = DateTime.now().millisecondsSinceEpoch;
          Duration remaining = Duration(milliseconds: estimateTs - now);
          var dateString =
              '${remaining.inHours}:${format.format(DateTime.fromMillisecondsSinceEpoch(remaining.inMilliseconds))}';
          // print("date ==>>>"+dateString);
          if (remaining.inHours < 0) {
            return Container(
              // color: Colors.greenAccent.withOpacity(0.3),
              alignment: Alignment.center,
              child: Text(
                "หมดเวลาแล้วกรุณาทำรายการใหม่",
                style: TextStyle(fontSize: 28.0, color: Colors.red.shade600),
              ),
            );
          } else {
            return Container(
              // color: Colors.greenAccent.withOpacity(0.3),
              alignment: Alignment.center,
              child: Text(
                "หมดเวลาอีก: " + dateString,
                style: TextStyle(fontSize: 28.0, color: Colors.green),
              ),
            );
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('แลกสินค้าในร้าน FamilyMart'),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            imgProduct(),
            textNameProduct(),
            textYourPoint(),
            textCode(),
            timmer(),
            MyStyles().mysizedBox,
            btnOk(context),
          ],
        ),
      ),
    );
  }
}
