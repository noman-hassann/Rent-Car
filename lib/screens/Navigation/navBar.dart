import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:rent_house/config/color.dart';
import 'package:rent_house/screens/Home/home.dart';
import 'package:rent_house/screens/Result/result.dart';



class NavBar extends StatefulWidget {
  const NavBar({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 1,
      length: 4,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MotionTabBar(
        initialSelectedTab: "Home",
        useSafeArea: true, // default: true, apply safe area wrapper
        labels: const ["Home", "Explore", "Favourite", "Profile"],
        icons: const [Icons.home, Icons.search, CupertinoIcons.heart, Icons.person],

        // optional badges, length must be same with labels
         tabSize: 50,
        tabBarHeight: 55,
        textStyle: const TextStyle(
          fontSize: 12,
          color:textblack,
          fontWeight: FontWeight.w500,
        ),
        tabIconColor: textwhite,
        tabIconSize: 28.0,
        tabIconSelectedSize: 26.0,
        tabSelectedColor: orange,
        tabIconSelectedColor: Colors.white,
        tabBarColor: Colors.white,
        onTabItemSelected: (int value) {
          setState(() {
            _tabController!.index = value;
          });
        },
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(), // swipe navigation handling is not supported
        controller: _tabController,
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          Home(),
          result(),
          Home(),
          Home(),
        
        ],
      ),
    );
  }
}