import 'package:condo_project/unitity/myStyle.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key key}) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  Container imageHeader(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 50.0),
      width: MediaQuery.of(context).size.width,
      child: Image.network(
          "https://droidsans.com/wp-content/uploads/2021/05/iphone-12-1280x720.jpg"),
    );
  }

  Row textHeader() {
    return Row(
      children: [
        Text(
          "iPhone 12 mini",
          style: TextStyle(fontSize: 24.0),
        ),
      ],
    );
  }

  Text textDetail() {
    return Text(
        "การสั่งซื้อสินค้าไอโฟน 12 (iPhone 12) จากร้านค้าต่างๆ จะได้รับบริการเคลมคืนสินค้ากรณีสินค้ามีปัญหา ตามที่ทางร้านระบุ แต่หากซื้อผ่าน apple.com หรือจาก Apple Store โดยปัจจุบันมี 2 สาขาในไทยคือไอคอนสยาม และเซ็นทรัลเวิลด์ จะคืนสินค้าได้ใน 14 วัน ได้ด้วยเหตุผลไม่พึงพอใจในตัวสินค้า แม้ว่าสินค้าจะไม่เสียหาย ถึงแม้ว่าเมื่อซื้อจากร้านอื่นนอกจาก Apple Store จะคืนสินค้า 14 วันด้วยเหตุผลไม่พึงพอใจในสินค้า แต่ผู้ซื้อก็ยังได้รับบริการความช่วยเหลือจากผู้เชี่ยวชาญจากแอปเปิลได้เช่นกัน",
        style: TextStyle(color: Colors.white, fontSize: 16),
        textAlign: TextAlign.left);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          imageHeader(context),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Container(
              child: Column(
                children: [
                  textHeader(),
                  MyStyles().mysizedBox,
                  MyStyles().mysizedBox,
                  MyStyles().mysizedBox,
                  textDetail(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            '12 แต้ม',
                            style: TextStyle(
                              color: Color.fromRGBO(187, 134, 252, 1),
                            ),
                          )),
                    ],
                  )
                ],
              ),
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 0.3,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
