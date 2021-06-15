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
   Container contentAboutUs(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.2,
      color: Colors.grey.shade800,
      child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque neque tellus, semper finibus auctor eu, hendrerit at nunc. Suspendisse potenti. Proin euismod mollis urna, quis fermentum enim venenatis eget. Quisque tincidunt luctus lectus, a semper tortor interdum nec. Proin dapibus eleifend massa, et euismod erat commodo sed. Sed rutrum ut est ut efficitur. Donec dictum, ligula vel bibendum consectetur, risus elit dignissim eros, vitae ultricies ipsum purus at odio. Interdum et malesuada fames ac ante ipsum primis in faucibus. Cras tincidunt augue vitae nisi placerat laoreet. Etiam elementum ullamcorper ex. Proin in nisi quis ligula laoreet rutrum vitae vel leo."),
    );
  }

  Container contentOther(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.3,
      color: Colors.grey.shade900,
      child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque neque tellus, semper finibus auctor eu, hendrerit at nunc. Suspendisse potenti. Proin euismod mollis urna, quis fermentum enim venenatis eget. Quisque tincidunt luctus lectus, a semper tortor interdum nec. Proin dapibus eleifend massa, et euismod erat commodo sed. Sed rutrum ut est ut efficitur. Donec dictum, ligula vel bibendum consectetur, risus elit dignissim eros, vitae ultricies ipsum purus at odio. Interdum et malesuada fames ac ante ipsum primis in faucibus. Cras tincidunt augue vitae nisi placerat laoreet. Etiam elementum ullamcorper ex. Proin in nisi quis ligula laoreet rutrum vitae vel leo."),
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
          MyStyles().mysizedBox,
          contentOther(context),
          MyStyles().mysizedBox,
          map(),
        ],
      ),
    );
  }
}
