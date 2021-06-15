import 'package:condo_project/productDetail/productDetail.dart';
import 'package:flutter/material.dart';

class FamilyMartPage extends StatefulWidget {
  const FamilyMartPage({Key key}) : super(key: key);

  @override
  _FamilyMartPageState createState() => _FamilyMartPageState();
}

class _FamilyMartPageState extends State<FamilyMartPage> {
  List listProducts = [
    {
      "name": "iPhone12",
      "point": "12",
      "pic":
          "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/iphone-12-pro-family-hero?wid=940&amp;hei=1112&amp;fmt=jpeg&amp;qlt=80&amp;.v=1604021663000",
    },
    {
      "name": "iPhone10",
      "point": "10",
      "pic":
          "https://d2pa5gi5n2e1an.cloudfront.net/webp/global/images/product/mobilephones/Apple_iPhone_X_/Apple_iPhone_X__L_1.jpg",
    },
    {
      "name": "Galaxy a51",
      "point": "20",
      "pic":
          "https://www.iphone-droid.net/spec/wp-content/uploads/2020/01/Samsung-Galaxy-A51-Photo-05.jpg",
    },
    {
      "name": "Galaxy A11",
      "point": "30",
      "pic":
          "https://d2pa5gi5n2e1an.cloudfront.net/global/images/product/mobilephones/Samsung_Galaxy_A11_/Samsung_Galaxy_A11__L_1.jpg",
    },
  ];

  Widget showProducts() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(top: 10, bottom: 90, left: 10, right: 10),
        child: GridView.count(
          scrollDirection: Axis.vertical,
          crossAxisCount: 2,
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 5.0,
          shrinkWrap: true,
          children: List.generate(
            listProducts.length,
            (index) {
              return cardProduct(index);
            },
          ),
        ),
      ),
    );
  }

  Card cardProduct(int index) {
    return Card(
      child: InkWell(
        onTap: () {
          MaterialPageRoute materialPageRoute = MaterialPageRoute(builder: (context)=>ProductDetailPage());
          Navigator.of(context).push(materialPageRoute);
        },
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Container(
                child: Image.network(
                  listProducts[index]['pic'],
                  fit: BoxFit.cover,
                ),
                padding: EdgeInsets.all(20.0),
                height: 135.0,
                width: 135.0,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.0,
                    color: Color(0xFFF9AD16),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Text(listProducts[index]['name']),
                Text(
                  listProducts[index]['point'] + ' แต้ม',
                  style: TextStyle(color: Colors.redAccent),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  ListView showOrderDetails() {
    return ListView(
      children: [
        Icon(Icons.directions_transit),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                indicatorColor: Color.fromRGBO(187, 134, 252, 1),
                tabs: [
                  Text(
                    "สินค้า",
                    style: TextStyle(fontSize: 25.0),
                  ),
                  Text(
                    "รายการที่สั่ง",
                    style: TextStyle(fontSize: 25.0),
                  ),
                ],
              ),
              // title: Text('Tabs Demo'),
            ),
            body: TabBarView(
              children: [
                showProducts(),
                showOrderDetails(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
