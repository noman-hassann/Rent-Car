import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_house/config/color.dart';
import 'package:rent_house/screens/Explore/Explore.dart';
import 'package:rent_house/screens/Home/home.dart';
import 'package:rent_house/screens/Liked/liked.dart';
import 'package:rent_house/screens/Setting/setting.dart';

class LandingPageController extends GetxController {
  var tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class LandingPage extends StatelessWidget {


  final TextStyle unselectedLabelStyle =  const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.normal,
      fontSize: 0);

  final TextStyle selectedLabelStyle =
      const TextStyle(color: orange, fontWeight: FontWeight.bold, fontSize: 12);

  const LandingPage({Key? key}) : super(key: key);


  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(() => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SizedBox(
          height: 60,
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: landingPageController.changeTabIndex,
            currentIndex: landingPageController.tabIndex.value,
           // backgroundColor: Color.fromARGB(255, 222, 152, 24),
            unselectedItemColor:textwhite,
            selectedItemColor: orange,
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,
            items: [
              BottomNavigationBarItem(
                
                icon: Container(
                //  margin: const EdgeInsets.only(bottom: 7),
                  child: const Icon(
                    Icons.home,
                    size: 30.0,
                  ),
                ),
                label: 'Home',
               backgroundColor:Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Container(
                 // margin:const EdgeInsets.only(bottom: 7),
                  child: const Icon(
                    Icons.search,
                    size: 25.0,
                  ),
                ),
                label: 'Explore',
             //   backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
              ),
              BottomNavigationBarItem(
                icon: Container(
               //   margin:const  EdgeInsets.only(bottom: 7),
                  child: const Icon(
                    Icons.favorite,
                    size: 25.0,
                  ),
                ),
                label: 'Favourite',
              //  backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
              ),
              BottomNavigationBarItem(
                icon: Container(
                 // margin: const EdgeInsets.only(bottom: 7),
                  child:const Icon(
                    Icons.settings,
                    size: 25.0,
                  ),
                ),
                label: 'Settings',
              //  backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
              ),
            ],
          ),
        )));
  }

  @override
  Widget build(BuildContext context) {
    final LandingPageController landingPageController =
        Get.put(LandingPageController(), permanent: false);
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar:
          buildBottomNavigationMenu(context, landingPageController),
      body: Obx(() => IndexedStack(
            index: landingPageController.tabIndex.value,
            children: [
              Home(),
              Explore(),
              Liked(),
              Setting(),
            ],
          )),
    ));
  }
}
