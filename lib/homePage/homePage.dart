import 'package:condo_project/unitity/myStyle.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //pic
  List pic = [
    "images/pic1.jpg",
    "images/pic2.jpg",
    "images/pic3.png",
    "images/pic4.jpg",
    "images/pic5.jpg",
    "images/pic6.jpg"
  ];

  ///medthod
  Builder slideImage() {
    return Builder(
      builder: (context) {
        final double height = MediaQuery.of(context).size.height * 0.5;
        return CarouselSlider(
          options: CarouselOptions(
            height: height,
            viewportFraction: 1.0,
            enlargeCenterPage: false,
            autoPlay: true,
          ),
          items: pic
              .map((item) => Container(
                    child: Center(
                        child: Image.asset(
                      item,
                      fit: BoxFit.cover,
                      height: height,
                    )),
                  ))
              .toList(),
        );
      },
    );
  }

  Widget textHeader() => Center(
          child: Text(
        "SERENITY CONDOMINIUM",
        style: TextStyle(fontSize: 26.0),
      ));

  Container map() {
    return Container(
      child: Image.asset('images/map.png'),
    );
  }

  Widget contentAboutUs(BuildContext context) {
    return Container(
      // padding: EdgeInsets.fromLTRB(0, 20.0, 0, 20.0),
      // height: MediaQuery.of(context).size.height * 0.3,
      color: Colors.grey.shade800,
      child: Image.asset('images/contentAboutUs.png',fit: BoxFit.cover,)
    );
  }

  Container contentOther(BuildContext context) {
    return Container(
      // padding: EdgeInsets.fromLTRB(0, 20.0, 0, 20.0),
      // height: MediaQuery.of(context).size.height * 0.3,
      color: Colors.grey.shade800,
      child: Image.asset('images/detailRoom.jpg',fit: BoxFit.cover,)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          textHeader(),
          slideImage(),
          MyStyles().mysizedBox,
          contentAboutUs(context),
          contentOther(context),
          MyStyles().mysizedBox,
          map(),
        ],
      ),
    );
  }
}
