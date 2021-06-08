import 'package:condo_project/homePage/homePage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LayOutPage extends StatefulWidget {
  const LayOutPage({Key? key}) : super(key: key);

  @override
  _LayOutPageState createState() => _LayOutPageState();
}

class _LayOutPageState extends State<LayOutPage> {
  int _selectedIndex = 0;
  Widget currentPage = HomePage();

  void _onItemTapped(int index) {
    if (index == 0) {
      // reward
    } else if (index == 1) {
      // famillymart
    } else if (index == 2) {
      //message
    } else if (index == 3) {
      //profile
    } else {
      //ข้อผิดลาด
    }
    setState(() {
      _selectedIndex = index;
    });
    print(index);
  }

  BottomNavigationBar menuBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      //vision2
      // backgroundColor: Color(0xFF6200EE),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(.60),
      selectedFontSize: 14,
      unselectedFontSize: 14,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.award),
          label: 'Reward',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.shoppingBasket),
          label: 'FamillyMart',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.award),
          label: 'Message',
        ),
        BottomNavigationBarItem(
          icon:FaIcon(FontAwesomeIcons.award),
          label: 'Profile',
        ),
      ],
      currentIndex: _selectedIndex,
      // selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
    );
  }

  FloatingActionButton floatingActionButtonHome() {
    return FloatingActionButton(
      backgroundColor: Colors.grey.shade900,
      onPressed: () {
        setState(() {
          currentPage = HomePage();
        });
      },
      tooltip: 'Home',
      child: Icon(Icons.home, size: 50.0, color: Colors.white),
      elevation: 2.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: currentPage,
      ),
      bottomNavigationBar: menuBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: floatingActionButtonHome(),
    );
  }
}
