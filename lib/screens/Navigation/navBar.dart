import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rent_house/config/color.dart';
import 'package:rent_house/screens/Explore/Explore.dart';
import 'package:rent_house/screens/Home/home.dart';
import 'package:rent_house/screens/Liked/liked.dart';
import 'package:rent_house/screens/Setting/setting.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
           _selectedIndex = index;
          },
          children: <Widget>[
            Home(),
            Explore(),
            Liked(),
            Setting(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: orange,
        unselectedItemColor: textwhite,
        elevation: 10,
        iconSize: 30,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              label: "Home",
              icon: Icon(
                Icons.home,
              )),
          BottomNavigationBarItem(
            label: "Explore",
            icon: Icon(Icons.search),
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            label: "Favourite",
            icon: Icon(CupertinoIcons.heart),
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.person),
            backgroundColor: Colors.white,
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    _selectedIndex = index;
    //
    //
    //using this page controller you can make beautiful animation effects
    _pageController.animateToPage(index,
        duration: Duration(milliseconds: 200), curve: Curves.easeIn);
  }
}
