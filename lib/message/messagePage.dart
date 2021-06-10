import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              InkWell(
                onTap: () {},
                child: const ListTile(
                  title: Text('คุณ: สุเมธ ดวงมาลัย'),
                  subtitle:
                      Text('โปรดส่งต่ออ....'),
                  trailing: Text("20:08 9/6/2564"),
                ),
              ),
              InkWell(
                onTap: () {},
                child: const ListTile(
                  title: Text('คุณ: ธนพล ปิ่นบัววัน'),
                  subtitle:
                      Text('โปรดส่งต่ออ....'),
                  trailing: Text("20:08 9/6/2564"),
                ),
              ),
              InkWell(
                onTap: () {},
                child: const ListTile(
                  title: Text('คุณ: นัทวุด ศรีระหว้า'),
                  subtitle:
                      Text('โปรดส่งต่ออ....'),
                  trailing: Text("20:08 9/6/2564"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
