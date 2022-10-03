import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:rent_house/Config/color.dart';
import 'package:rent_house/View/Admin/Setting/adminSetting.dart';
import 'package:rent_house/View/Admin/View_Property/Admin.dart';

import '../Add_New_Property/AddProperty.dart';

class AdminNavbar extends StatefulWidget {
  const AdminNavbar({super.key});

  @override
  _AdminNavbarState createState() => _AdminNavbarState();
}

class _AdminNavbarState extends State<AdminNavbar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    Admin(),
    AddProperty(),
    // favourite(),
    AdminSetting(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              )
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                //rippleColor: Color.fromARGB(255, 209, 63, 63)!,
                hoverColor: orange,
                gap: 6,
                activeColor: Colors.black,
                iconSize: 20,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: const Duration(milliseconds: 400),
                tabBackgroundColor: orange,
                color: Colors.black,
                tabs: const [
                  GButton(
                    icon: CupertinoIcons.home,
                    iconActiveColor: Colors.white,
                    text: 'Your Property',
                    textColor: Colors.white,
                  ),
                  GButton(
                    icon: CupertinoIcons.add_circled_solid,
                    iconActiveColor: Colors.white,
                    text: 'Add Property',
                    textColor: Colors.white,
                  ),
                  // GButton(
                  //   icon: CupertinoIcons.heart,
                  //   iconActiveColor: Colors.white,
                  //   text: 'Likes',
                  //   textColor: Colors.white,
                  // ),
                  GButton(
                    icon: CupertinoIcons.person,
                    iconActiveColor: Colors.white,
                    text: 'Profile',
                    textColor: Colors.white,
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
