import 'package:condo_project/reward/rewardDetailPage.dart';
import 'package:flutter/material.dart';

class RewardPage extends StatefulWidget {
  const RewardPage({Key key}) : super(key: key);

  @override
  _RewardPageState createState() => _RewardPageState();
}

class _RewardPageState extends State<RewardPage> {
  

  InkWell cardProduct() {
    return InkWell(
      onTap: () {
        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (context) => RewardDetailPage());
        Navigator.of(context).push(materialPageRoute);
      },
      child: Card(
        color: Color.fromRGBO(112, 112, 112, 200),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            ListTile(
              // leading: Icon(Icons.arrow_drop_down_circle),
              title: Text('Family Mart'),
              // subtitle: Text(
              //   'Secondary Text',
              //   style: TextStyle(color: Colors.black.withOpacity(0.6)),
              // ),
            ),
            Image.network(
                'https://droidsans.com/wp-content/uploads/2021/05/iphone-12-1280x720.jpg'),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'แลกสินค้าใน Family Mart',
                style: TextStyle(color: Colors.white.withOpacity(0.6)),
              ),
            ),
            
            // ButtonBar(
            //   alignment: MainAxisAlignment.start,
            //   children: [
            //     TextButton(
            //       onPressed: () {
            //         // Perform some action
            //       },
            //       child: Text(
            //         '12 แต้ม',
            //         style: TextStyle(color: Color.fromRGBO(187, 134, 252, 1)),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return cardProduct();
          },
        ),
      ),
    );
  }
}
